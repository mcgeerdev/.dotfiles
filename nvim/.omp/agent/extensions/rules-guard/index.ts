/**
 * rules-guard — enforce the Claude `permissions.deny` policy across ALL omp tools.
 *
 * Why this exists:
 *   omp's `bashInterceptor` only inspects the `bash` tool, so RULES.md is trivially
 *   bypassed by calling `read`/`write`/`edit`/`find`/`search`/`eval` directly. This
 *   `tool_call` guard runs before EVERY tool, fail-closes on any attempt to touch a
 *   denied path, and enforces the denied bash command patterns too. A `tool_result`
 *   pass redacts secret-shaped output as defense in depth.
 *
 * Policy source (single source of truth, deny-only — deny always wins in Claude):
 *   - ~/.claude/settings.json        → permissions.deny
 *   - ~/.claude/remote-settings.json → permissions.deny
 *   Both are read at load; if missing/invalid we fall back to the embedded snapshot
 *   below so the guard still works standalone. `allow` entries are intentionally
 *   ignored (a deny rule cannot be overridden by allow).
 *
 * NOT a sandbox: extensions run in-process and bash/eval can read bytes in ways a
 * text scan cannot fully enumerate (a bare `cat server.key` with no path separator,
 * base64, custom interpreters, …). The only hard boundary is OS filesystem
 * permissions — run omp as a user without read access to these paths, or in a
 * container where they are not mounted. This guard stops the common/accidental
 * paths and hands the model a clear, actionable reason.
 */
import type { ExtensionAPI } from "@oh-my-pi/pi-coding-agent";
import fs from "node:fs";
import os from "node:os";
import nodePath from "node:path";

// ── Embedded fallback: union of both Claude deny lists (snapshot 2026-06-26) ──
export const EMBEDDED_DENY: string[] = [
  "Bash(op *)",
  "Bash(op)",
  "Bash(tofu apply *)",
  "Bash(rm -rf *)",
  "Bash(git push --force *)",
  "Bash(git reset --hard *)",
  "Edit(~/.bashrc)",
  "Edit(~/.zshrc)",
  "Read(**/*.id_ed25519)",
  "Read(**/*.key)",
  "Read(**/*.pem)",
  "Read(**/*mise.local.toml)",
  "Read(**/.aws/**)",
  "Read(**/.dev.vars*)",
  "Read(**/.env*)",
  "Read(**/.npmrc)",
  "Read(**/.pypirc)",
  "Read(**/.ssh/**)",
  "Read(**/config/credentials.json)",
  "Read(**/config/database.yml)",
  "Read(**/secrets/**)",
  "Read(~/.config/gh/**)",
  "Read(~/.git-credentials)",
  "Read(~/.gnupg/**)",
  "Read(~/.kube/**)",
  "Read(~/.npmrc)",
  "Write(**/.env*)",
  "Write(**/.ssh/**)",
  "Write(**/secrets/**)",
];

const CLAUDE_FILES = ["settings.json", "remote-settings.json"].map((f) =>
  nodePath.join(os.homedir(), ".claude", f),
);

// Claude permission "tool" names mapped onto omp tool classes.
const CLAUDE_READ_TOOLS: Record<string, true> = {
  Read: true,
  Glob: true,
  Grep: true,
  LS: true,
  NotebookRead: true,
};
const CLAUDE_WRITE_TOOLS: Record<string, true> = {
  Edit: true,
  Write: true,
  Update: true,
  MultiEdit: true,
  NotebookEdit: true,
};

// omp tool name → read/write classification (selects glob strictness only;
// detection itself is field-driven below, so unknown tools are still checked).
const READ_CLASS: Record<string, true> = {
  read: true,
  search: true,
  grep: true,
  find: true,
  glob: true,
  ast_grep: true,
  list: true,
  ls: true,
  cat: true,
  notebook_read: true,
};
const WRITE_CLASS: Record<string, true> = {
  write: true,
  edit: true,
  multiedit: true,
  multi_edit: true,
  apply_patch: true,
  str_replace: true,
  notebook: true,
  notebook_edit: true,
  ast_edit: true,
  create: true,
};

// Input field names that carry filesystem paths / executable text, across all tools.
const PATH_FIELDS: Record<string, true> = {
  path: true,
  paths: true,
  file: true,
  files: true,
  filename: true,
  filenames: true,
};
const SHELL_FIELDS: Record<string, true> = {
  command: true,
  cmd: true,
  script: true,
};
const CODE_FIELDS: Record<string, true> = { code: true };

// ── Rule compilation ──────────────────────────────────────────────────────────

export interface FileGlob {
  re: RegExp;
  src: string;
}
export interface BashRule {
  re: RegExp;
  src: string;
}
export interface Policy {
  readGlobs: FileGlob[];
  writeGlobs: FileGlob[];
  bash: BashRule[];
}

export function parseRule(
  entry: string,
): { tool: string; pattern: string } | null {
  const m = /^([A-Za-z_]+)\((.*)\)$/.exec(entry.trim());
  if (!m) return null;
  return { tool: m[1], pattern: m[2] };
}

/**
 * Compile a Claude/gitignore-style glob into a RegExp tested against an absolute
 * path. `**` crosses path segments, `*`/`?` stay within a segment, `~` expands to
 * home, a trailing `/**` also matches the directory itself, and a leading
 * `**`/relative pattern floats (matches at any depth).
 */
export function compileGlob(glob: string, home: string = os.homedir()): RegExp {
  let g = glob.trim();
  if (g === "~") g = home;
  else if (g.startsWith("~/")) g = home + g.slice(1);

  const floating = !(g.startsWith("/") || g.startsWith(home));

  let trailingDir = false;
  if (g.endsWith("/**")) {
    g = g.slice(0, -3);
    trailingDir = true;
  }

  let re = "";
  for (let i = 0; i < g.length; i++) {
    const c = g[i];
    if (c === "*" && g[i + 1] === "*") {
      i++;
      if (g[i + 1] === "/") {
        re += "(?:.*/)?";
        i++;
      } else {
        re += ".*";
      }
    } else if (c === "*") {
      re += "[^/]*";
    } else if (c === "?") {
      re += "[^/]";
    } else if (/[.\\^$+(){}\[\]|]/.test(c)) {
      re += "\\" + c;
    } else {
      re += c;
    }
  }

  const prefix = floating ? "(?:.*/)?" : "";
  const suffix = trailingDir ? "(?:/.*)?" : "";
  return new RegExp("^" + prefix + re + suffix + "$");
}

/**
 * Compile a Claude `Bash(...)` pattern into a RegExp tested against one command
 * segment. A trailing `*` ("any args") is dropped; literal whitespace becomes
 * `\s+`; a non-word/non-hyphen boundary is required after the matched head so
 * `git push --force *` does NOT match the safe `git push --force-with-lease`.
 */
export function bashMatcher(pattern: string): RegExp {
  const head = pattern.trim().replace(/\s*\*+\s*$/, "");
  const esc = head
    .replace(/[.\\+?^${}()|[\]]/g, "\\$&")
    .replace(/\s+/g, "\\s+")
    .replace(/\*/g, "[^\\s]*");
  return new RegExp("^" + esc + "(?![-\\w])");
}

export function buildPolicy(
  entries: string[],
  home: string = os.homedir(),
): Policy {
  const readGlobs: FileGlob[] = [];
  const writeGlobs: FileGlob[] = [];
  const bash: BashRule[] = [];
  const seen = new Set<string>();
  for (const e of entries) {
    if (typeof e !== "string" || seen.has(e)) continue;
    seen.add(e);
    const r = parseRule(e);
    if (!r) continue;
    if (r.tool === "Bash") bash.push({ re: bashMatcher(r.pattern), src: e });
    else if (CLAUDE_READ_TOOLS[r.tool])
      readGlobs.push({ re: compileGlob(r.pattern, home), src: e });
    else if (CLAUDE_WRITE_TOOLS[r.tool])
      writeGlobs.push({ re: compileGlob(r.pattern, home), src: e });
    // other Claude tools (WebFetch, etc.) have no omp filesystem analogue → ignore
  }
  return { readGlobs, writeGlobs, bash };
}

export function loadDenyEntries(files: string[] = CLAUDE_FILES): string[] {
  const entries = [...EMBEDDED_DENY];
  for (const f of files) {
    try {
      const parsed = JSON.parse(fs.readFileSync(f, "utf8"));
      const deny = parsed?.permissions?.deny;
      if (Array.isArray(deny))
        for (const d of deny) if (typeof d === "string") entries.push(d);
    } catch {
      // missing or invalid file → rely on embedded snapshot + the other file
    }
  }
  return entries;
}

// ── Path / token helpers ────────────────────────────────────────────────────

/**
 * Absolute path candidates for one raw path argument. Resolves `~` and cwd,
 * strips read selectors (`:50-100`, `:raw`), and decomposes archive members
 * (`a.zip:secrets/k`) into inner sub-paths so each piece is checkable.
 */
export function candidateAbsPaths(raw: string, cwd: string): string[] {
  let p = (raw ?? "").trim();
  if (!p || /^[a-z][\w+.-]*:\/\//i.test(p) || /^(?:data|mailto):/i.test(p))
    return [];
  p = p.replace(/(:(?:\d[\w,+\-]*|raw|conflicts))+$/i, "");
  const base = cwd || process.cwd();
  const home = os.homedir();
  const out = new Set<string>();
  out.add(
    nodePath.resolve(
      base,
      p.startsWith("~") ? nodePath.join(home, p.slice(1)) : p,
    ),
  );
  if (p.includes(":")) {
    for (const seg of p.split(":")) {
      const s = seg.trim();
      if (s)
        out.add(
          nodePath.resolve(
            base,
            s.startsWith("~") ? nodePath.join(home, s.slice(1)) : s,
          ),
        );
    }
  }
  return [...out];
}

/**
 * Path-shaped tokens from a command/code string. Conservative on purpose: a token
 * counts only if it carries a path signal (`/`, leading `~`, or a leading dotfile
 * dot). This blocks `cat .env`, `open('.env')`, `~/.ssh/id_ed25519`, `./x.key`,
 * `secrets/p.json`, while leaving ordinary code like `process.env` or `obj.key`
 * untouched. Bare `server.key` (no separator) is deliberately not flagged here.
 */
export function pathTokens(text: string): string[] {
  const out: string[] = [];
  for (let t of text.split(/[\s,;|&()<>'"`=]+/)) {
    t = t.replace(/^[([{]+|[)\]};,]+$/g, "");
    if (!t) continue;
    if (t.includes("/") || t.startsWith("~") || /^\.[^.\/]/.test(t))
      out.push(t);
  }
  return out;
}

function asArr(v: unknown): string[] {
  if (typeof v === "string") return [v];
  if (Array.isArray(v))
    return v.filter((x): x is string => typeof x === "string");
  return [];
}

// Paths embedded in an `edit` hashline patch body: `[PATH#1A2B]`.
function editHeaderPaths(input: Record<string, unknown>): string[] {
  const body = input.input ?? input._input;
  if (typeof body !== "string") return [];
  const out: string[] = [];
  for (const m of body.matchAll(/\[([^\]\n#]+)#[0-9A-Fa-f]{3,8}\]/g))
    out.push(m[1].trim());
  return out;
}

function fieldValues(
  input: Record<string, unknown>,
  fields: Record<string, true>,
): string[] {
  const out: string[] = [];
  for (const key of Object.keys(input)) {
    if (!fields[key]) continue;
    for (const s of asArr(input[key])) out.push(s);
  }
  return out;
}

function fileMsg(target: string, src: string): string {
  return `Blocked by deny policy: "${target}" matches \`${src}\`. This is a protected secret/credential path — ask the User to fetch it; do not read, write, or reference it.`;
}

function bashSegments(cmd: string): string[] {
  const out: string[] = [];
  for (const raw of cmd.split(/\n|;|&&|\|\||[|&]/)) {
    let p = raw.trim();
    for (;;) {
      const m =
        /^(?:sudo|command|builtin|exec|time|nice|nohup)\s+/.exec(p) ||
        /^[A-Za-z_]\w*=[^\s]*\s+/.exec(p);
      if (!m) break;
      p = p.slice(m[0].length);
    }
    if (p) out.push(p);
  }
  return out;
}

function matchFile(
  candidates: string[],
  globs: FileGlob[],
): FileGlob | undefined {
  for (const c of candidates) for (const g of globs) if (g.re.test(c)) return g;
  return undefined;
}

// ── Decision ──────────────────────────────────────────────────────────────────

export interface Decision {
  block: boolean;
  reason?: string;
}

/** Pure block/allow decision for one tool call. Detection is field-driven so it
 *  covers every tool (read/write/edit/find/grep/python/eval/browser/…) regardless
 *  of the exact registered name. Exported for tests. */
export function decide(
  toolName: string,
  input: Record<string, unknown>,
  cwd: string,
  policy: Policy = POLICY,
): Decision {
  const inp = input ?? {};
  const allGlobs = [...policy.readGlobs, ...policy.writeGlobs];
  const isWrite = WRITE_CLASS[toolName] === true;
  const pathGlobs =
    !isWrite && READ_CLASS[toolName] ?...
