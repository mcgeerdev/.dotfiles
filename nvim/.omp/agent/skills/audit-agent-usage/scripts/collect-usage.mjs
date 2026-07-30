#!/usr/bin/env node

import crypto from "node:crypto";
import fs from "node:fs";
import os from "node:os";
import path from "node:path";

const DEFAULT_AUDIT_DIR = path.join(os.homedir(), ".dotfiles", "nvim", ".omp", "audits");

function parseArgs(argv) {
  const dateStamp = new Date().toISOString().slice(0, 10);
  const args = {
    claudeRoot: path.join(os.homedir(), ".claude", "projects"),
    ompRoot: path.join(os.homedir(), ".omp", "agent", "sessions"),
    sinceDays: 30,
    output: path.join(DEFAULT_AUDIT_DIR, `agent-usage-audit-${dateStamp}.json`),
    previousSummary: null,
  };

  for (let i = 0; i < argv.length; i += 1) {
    const flag = argv[i];
    const value = argv[i + 1];
    if (flag === "--claude-root" && value) args.claudeRoot = path.resolve(value), i += 1;
    else if (flag === "--omp-root" && value) args.ompRoot = path.resolve(value), i += 1;
    else if (flag === "--since-days" && value) args.sinceDays = Number(value), i += 1;
    else if (flag === "--output" && value) args.output = path.resolve(value), i += 1;
    else if (flag === "--previous-summary" && value) args.previousSummary = path.resolve(value), i += 1;
    else if (flag === "--help" || flag === "-h") {
      console.log(`Usage: collect-usage.mjs [options]

Options:
  --claude-root PATH       Claude projects root
  --omp-root PATH          Oh My Pi sessions root
  --since-days N           Include files modified in the last N days (default: 30)
  --output PATH            JSON output path (default: ~/.dotfiles/nvim/.omp/audits/agent-usage-audit-YYYY-MM-DD.json)
  --previous-summary PATH  Prior JSON summary (default: newest earlier audit in the output directory)`);
      process.exit(0);
    } else {
      throw new Error(`Unknown or incomplete argument: ${flag}`);
    }
  }

  if (!Number.isFinite(args.sinceDays) || args.sinceDays <= 0) {
    throw new Error("--since-days must be a positive number");
  }
  return args;
}

function walkJsonl(root) {
  if (!fs.existsSync(root)) return [];
  const result = [];
  const stack = [root];
  while (stack.length) {
    const dir = stack.pop();
    for (const entry of fs.readdirSync(dir, { withFileTypes: true })) {
      const fullPath = path.join(dir, entry.name);
      if (entry.isDirectory()) stack.push(fullPath);
      else if (entry.isFile() && entry.name.endsWith(".jsonl")) result.push(fullPath);
    }
  }
  return result;
}

function emptyUsage() {
  return {
    input: 0,
    output: 0,
    cacheRead: 0,
    cacheWrite: 0,
    reasoning: 0,
    totalTokens: 0,
    cost: 0,
  };
}

function addUsage(target, usage) {
  for (const key of Object.keys(target)) target[key] += Number(usage[key] || 0);
}

function stable(value) {
  if (Array.isArray(value)) return `[${value.map(stable).join(",")}]`;
  if (value && typeof value === "object") {
    return `{${Object.keys(value).sort().map((key) => `${JSON.stringify(key)}:${stable(value[key])}`).join(",")}}`;
  }
  return JSON.stringify(value);
}

function toolSignature(name, args) {
  return crypto.createHash("sha256").update(`${name}\0${stable(args ?? {})}`).digest("hex").slice(0, 16);
}

function newSession(source, kind, filePath, stat) {
  return {
    source,
    kind,
    path: filePath,
    relativePath: "",
    sessionId: "",
    cwd: "",
    startedAt: null,
    endedAt: null,
    modifiedAt: stat.mtime.toISOString(),
    mtimeMs: stat.mtimeMs,
    bytes: stat.size,
    userMessages: 0,
    assistantMessages: 0,
    toolResults: 0,
    toolCalls: 0,
    toolErrors: 0,
    duplicateToolCalls: 0,
    subagentCalls: 0,
    durationSeconds: 0,
    usage: emptyUsage(),
    models: {},
    tools: {},
    _toolSignatures: new Map(),
    _timestamps: [],
  };
}

function recordTool(session, name, args) {
  const tool = String(name || "unknown");
  session.toolCalls += 1;
  session.tools[tool] = (session.tools[tool] || 0) + 1;
  if (/^(task|agent|subagent|delegate_task)$/i.test(tool)) session.subagentCalls += 1;

  const signature = toolSignature(tool, args);
  const seen = session._toolSignatures.get(signature) || 0;
  session._toolSignatures.set(signature, seen + 1);
  if (seen > 0) session.duplicateToolCalls += 1;
}

function recordModel(session, model, usage) {
  const key = String(model || "unknown");
  session.models[key] ||= { messages: 0, ...emptyUsage() };
  session.models[key].messages += 1;
  addUsage(session.models[key], usage);
}

function normalizeClaudeUsage(raw = {}) {
  const usage = {
    input: Number(raw.input_tokens || 0),
    output: Number(raw.output_tokens || 0),
    cacheRead: Number(raw.cache_read_input_tokens || 0),
    cacheWrite: Number(raw.cache_creation_input_tokens || 0),
    reasoning: 0,
    totalTokens: 0,
    cost: 0,
  };
  usage.totalTokens = usage.input + usage.output + usage.cacheRead + usage.cacheWrite;
  return usage;
}

function normalizeOmpUsage(raw = {}) {
  return {
    input: Number(raw.input || 0),
    output: Number(raw.output || 0),
    cacheRead: Number(raw.cacheRead || 0),
    cacheWrite: Number(raw.cacheWrite || 0),
    reasoning: Number(raw.reasoningTokens || 0),
    totalTokens: Number(raw.totalTokens || 0),
    cost: Number(raw.cost?.total || 0),
  };
}

function parseClaude(filePath, root, stat) {
  const session = newSession("claude", "main", filePath, stat);
  session.relativePath = path.relative(root, filePath);
  const usageRows = new Map();
  const toolIds = new Set();

  for (const line of fs.readFileSync(filePath, "utf8").split("\n")) {
    if (!line) continue;
    let row;
    try { row = JSON.parse(line); } catch { continue; }

    if (row.sessionId && !session.sessionId) session.sessionId = String(row.sessionId);
    if (row.cwd && !session.cwd) session.cwd = String(row.cwd);
    if (row.timestamp) session._timestamps.push(Date.parse(row.timestamp));

    const message = row.message;
    if (!message) continue;
    if (message.role === "user") session.userMessages += 1;
    if (message.role === "assistant") {
      session.assistantMessages += 1;
      if (message.usage) {
        const key = `${row.requestId || ""}:${message.id || row.uuid || session.assistantMessages}`;
        const normalized = normalizeClaudeUsage(message.usage);
        const prior = usageRows.get(key);
        if (!prior || normalized.totalTokens > prior.usage.totalTokens) {
          usageRows.set(key, { model: message.model || "unknown", usage: normalized });
        }
      }
    }

    if (!Array.isArray(message.content)) continue;
    for (const block of message.content) {
      if (block?.type === "tool_use") {
        const id = block.id ? String(block.id) : null;
        if (id && toolIds.has(id)) continue;
        if (id) toolIds.add(id);
        recordTool(session, block.name, block.input);
      } else if (block?.type === "tool_result") {
        session.toolResults += 1;
        if (block.is_error) session.toolErrors += 1;
      }
    }
  }

  for (const row of usageRows.values()) {
    addUsage(session.usage, row.usage);
    recordModel(session, row.model, row.usage);
  }
  return finalizeSession(session);
}

function ompKind(filePath, root) {
  if (path.basename(filePath) === "__advisor.jsonl") return "advisor";
  return path.relative(root, filePath).split(path.sep).length === 2 ? "main" : "subagent";
}

function parseOmp(filePath, root, stat) {
  const session = newSession("omp", ompKind(filePath, root), filePath, stat);
  session.relativePath = path.relative(root, filePath);
  const toolIds = new Set();

  for (const line of fs.readFileSync(filePath, "utf8").split("\n")) {
    if (!line) continue;
    let row;
    try { row = JSON.parse(line); } catch { continue; }

    if (row.type === "session") {
      session.sessionId ||= String(row.id || "");
      session.cwd ||= String(row.cwd || "");
      if (row.timestamp) session._timestamps.push(Date.parse(row.timestamp));
    }
    if (row.timestamp) session._timestamps.push(Date.parse(row.timestamp));

    const message = row.message;
    if (!message) continue;
    if (message.role === "user") session.userMessages += 1;
    else if (message.role === "assistant") {
      session.assistantMessages += 1;
      if (message.usage) {
        const usage = normalizeOmpUsage(message.usage);
        addUsage(session.usage, usage);
        recordModel(session, `${message.provider || "unknown"}/${message.model || "unknown"}`, usage);
      }
    } else if (message.role === "toolResult") {
      session.toolResults += 1;
      if (message.isError) session.toolErrors += 1;
    }

    if (!Array.isArray(message.content)) continue;
    for (const block of message.content) {
      if (block?.type !== "toolCall") continue;
      const id = block.id ? String(block.id) : null;
      if (id && toolIds.has(id)) continue;
      if (id) toolIds.add(id);
      recordTool(session, block.name, block.arguments);
    }
  }
  return finalizeSession(session);
}

function finalizeSession(session) {
  const times = session._timestamps.filter(Number.isFinite).sort((a, b) => a - b);
  if (times.length) {
    session.startedAt = new Date(times[0]).toISOString();
    session.endedAt = new Date(times[times.length - 1]).toISOString();
    session.durationSeconds = Math.max(0, Math.round((times[times.length - 1] - times[0]) / 1000));
  }
  session.sessionId ||= path.basename(session.path, ".jsonl");
  delete session._toolSignatures;
  delete session._timestamps;
  return session;
}

function aggregateSessions(sessions) {
  const aggregate = {
    files: sessions.length,
    userMessages: 0,
    assistantMessages: 0,
    toolCalls: 0,
    toolErrors: 0,
    duplicateToolCalls: 0,
    subagentCalls: 0,
    bytes: 0,
    usage: emptyUsage(),
    models: {},
    tools: {},
  };
  for (const session of sessions) {
    for (const key of ["userMessages", "assistantMessages", "toolCalls", "toolErrors", "duplicateToolCalls", "subagentCalls", "bytes"]) {
      aggregate[key] += session[key];
    }
    addUsage(aggregate.usage, session.usage);
    for (const [name, count] of Object.entries(session.tools)) aggregate.tools[name] = (aggregate.tools[name] || 0) + count;
    for (const [model, stats] of Object.entries(session.models)) {
      aggregate.models[model] ||= { messages: 0, ...emptyUsage() };
      aggregate.models[model].messages += stats.messages;
      addUsage(aggregate.models[model], stats);
    }
  }
  return aggregate;
}

function priorFiles(previousPath) {
  if (!previousPath || !fs.existsSync(previousPath)) return new Map();
  try {
    const previous = JSON.parse(fs.readFileSync(previousPath, "utf8"));
    return new Map((previous.sessions || []).map((session) => [
      `${session.source}:${session.path}`,
      `${session.mtimeMs}:${session.bytes}`,
    ]));
  } catch {
    return new Map();
  }
}

function latestPriorSummary(outputPath) {
  const directory = path.dirname(outputPath);
  if (!fs.existsSync(directory)) return null;
  const outputResolved = path.resolve(outputPath);
  const candidates = fs.readdirSync(directory)
    .filter((name) => /^agent-usage-audit-\d{4}-\d{2}-\d{2}\.json$/.test(name))
    .map((name) => path.join(directory, name))
    .filter((candidate) => path.resolve(candidate) !== outputResolved)
    .map((candidate) => ({ candidate, mtimeMs: fs.statSync(candidate).mtimeMs }))
    .sort((a, b) => b.mtimeMs - a.mtimeMs);
  return candidates[0]?.candidate || null;
}

const args = parseArgs(process.argv.slice(2));
const cutoff = Date.now() - args.sinceDays * 86_400_000;
const previousSummary = args.previousSummary || latestPriorSummary(args.output);
const previous = priorFiles(previousSummary);
const sessions = [];
const roots = [
  { source: "claude", root: args.claudeRoot, parser: parseClaude },
  { source: "omp", root: args.ompRoot, parser: parseOmp },
];
const sourceStatus = {};

for (const { source, root, parser } of roots) {
  sourceStatus[source] = { root, exists: fs.existsSync(root), discovered: 0, included: 0 };
  for (const filePath of walkJsonl(root)) {
    sourceStatus[source].discovered += 1;
    const stat = fs.statSync(filePath);
    if (stat.mtimeMs < cutoff) continue;
    const session = parser(filePath, root, stat);
    const prior = previous.get(`${source}:${filePath}`);
    session.changeStatus = !prior ? "new" : prior === `${stat.mtimeMs}:${stat.size}` ? "unchanged" : "changed";
    sessions.push(session);
    sourceStatus[source].included += 1;
  }
}

sessions.sort((a, b) => b.usage.totalTokens - a.usage.totalTokens);
const bySource = {};
const byKind = {};
for (const source of ["claude", "omp"]) bySource[source] = aggregateSessions(sessions.filter((s) => s.source === source));
for (const kind of ["main", "subagent", "advisor"]) byKind[kind] = aggregateSessions(sessions.filter((s) => s.kind === kind));

const output = {
  schemaVersion: 1,
  generatedAt: new Date().toISOString(),
  auditDirectory: path.dirname(args.output),
  previousSummary,
  window: {
    sinceDays: args.sinceDays,
    cutoff: new Date(cutoff).toISOString(),
    selectionBasis: "file modification time",
  },
  privacy: {
    transcriptContentIncluded: false,
    toolArgumentsIncluded: false,
    toolArgumentsHashedForDuplicateDetection: true,
  },
  sourceStatus,
  totals: aggregateSessions(sessions),
  bySource,
  byKind,
  changeCounts: Object.fromEntries(["new", "changed", "unchanged"].map((status) => [
    status,
    sessions.filter((session) => session.changeStatus === status).length,
  ])),
  reviewCandidates: {
    highestUsage: sessions.slice(0, 20).map((s) => s.path),
    repeatedTools: sessions.filter((s) => s.duplicateToolCalls > 0).sort((a, b) => b.duplicateToolCalls - a.duplicateToolCalls).slice(0, 20).map((s) => s.path),
    toolErrors: sessions.filter((s) => s.toolErrors > 0).sort((a, b) => b.toolErrors - a.toolErrors).slice(0, 20).map((s) => s.path),
    highFanout: sessions.filter((s) => s.subagentCalls >= 3).sort((a, b) => b.subagentCalls - a.subagentCalls).slice(0, 20).map((s) => s.path),
  },
  sessions,
};

fs.mkdirSync(path.dirname(args.output), { recursive: true, mode: 0o700 });
fs.writeFileSync(args.output, `${JSON.stringify(output, null, 2)}\n`, { mode: 0o600 });
console.log(JSON.stringify({
  output: args.output,
  sessions: sessions.length,
  sources: Object.fromEntries(Object.entries(sourceStatus).map(([key, value]) => [key, value.included])),
  newOrChanged: output.changeCounts.new + output.changeCounts.changed,
}, null, 2));
