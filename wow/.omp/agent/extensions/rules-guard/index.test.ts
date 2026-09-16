import { describe, expect, test } from "bun:test";
import os from "node:os";
import {
  bashMatcher,
  buildPolicy,
  compileGlob,
  decide,
  parseRule,
  redact,
  type Policy,
} from "./index.ts";

const HOME = "/home/u";
const CWD = "/work/repo";

// Fixed policy so the tests do not depend on the machine's ~/.claude settings.
const POLICY: Policy = buildPolicy(
  [
    "Read(**/*.key)",
    "Read(**/*.pem)",
    "Read(**/.aws/**)",
    "Read(**/.env*)",
    "Read(**/secrets/**)",
    "Read(**/.ssh/**)",
    "Read(~/.kube/**)",
    "Write(**/.env*)",
    "Edit(~/.zshrc)",
    "Bash(rm -rf *)",
    "Bash(git push --force *)",
    "Bash(kubectl apply*)",
    "Bash(op *)",
    "WebFetch(domain:example.com)",
    "not a rule",
  ],
  HOME,
);

describe("rule compilation", () => {
  test("parseRule splits tool and pattern, rejects junk", () => {
    expect(parseRule("Read(**/*.key)")).toEqual({
      tool: "Read",
      pattern: "**/*.key",
    });
    expect(parseRule("nonsense")).toBeNull();
  });

  test("policy buckets by Claude tool class and ignores non-filesystem tools", () => {
    expect(POLICY.readGlobs.map(g => g.src)).toContain("Read(**/.env*)");
    expect(POLICY.writeGlobs.map(g => g.src)).toEqual([
      "Write(**/.env*)",
      "Edit(~/.zshrc)",
    ]);
    expect(POLICY.bash).toHaveLength(4);
    expect([...POLICY.readGlobs, ...POLICY.writeGlobs].map(g => g.src)).not.toContain(
      "WebFetch(domain:example.com)",
    );
  });

  test("compileGlob floats relative patterns and expands ~", () => {
    const env = compileGlob("**/.env*", HOME);
    expect(env.test("/work/repo/.env")).toBe(true);
    expect(env.test("/work/repo/app/.env.local")).toBe(true);
    expect(env.test("/work/repo/env")).toBe(false);

    const kube = compileGlob("~/.kube/**", HOME);
    expect(kube.test(`${HOME}/.kube`)).toBe(true);
    expect(kube.test(`${HOME}/.kube/config`)).toBe(true);
    expect(kube.test("/work/repo/.kube/config")).toBe(false);
  });

  test("single * does not cross a path separator", () => {
    const re = compileGlob("/a/*/c", HOME);
    expect(re.test("/a/b/c")).toBe(true);
    expect(re.test("/a/b/x/c")).toBe(false);
  });

  test("bashMatcher requires a word boundary after the matched head", () => {
    const re = bashMatcher("git push --force *");
    expect(re.test("git push --force origin main")).toBe(true);
    expect(re.test("git push --force-with-lease")).toBe(false);
  });
});

describe("decide — path arguments", () => {
  test("blocks denied read targets", () => {
    expect(decide("read", { path: ".env" }, CWD, POLICY).block).toBe(true);
    expect(decide("read", { path: "app/.env.local" }, CWD, POLICY).block).toBe(true);
    expect(decide("read", { path: "certs/server.key" }, CWD, POLICY).block).toBe(true);
    expect(decide("read", { path: `${HOME}/.kube/config` }, CWD, POLICY).block).toBe(true);
    expect(decide("grep", { pattern: "x", path: "secrets/" }, CWD, POLICY).block).toBe(true);
  });

  test("allows ordinary files and non-filesystem URIs", () => {
    expect(decide("read", { path: "main.tf" }, CWD, POLICY).block).toBe(false);
    expect(decide("read", { path: "omp://extensions.md" }, CWD, POLICY).block).toBe(false);
    expect(decide("read", { path: "https://example.com/x.key" }, CWD, POLICY).block).toBe(false);
    expect(decide("write", { path: "main.tf", content: "x" }, CWD, POLICY).block).toBe(false);
  });

  test("read selectors and archive members are decomposed", () => {
    expect(decide("read", { path: ".env:1-10" }, CWD, POLICY).block).toBe(true);
    expect(decide("read", { path: "bundle.zip:secrets/token" }, CWD, POLICY).block).toBe(true);
  });

  test("unknown tools are checked against every glob (fail-closed)", () => {
    expect(decide("some_future_tool", { file: "cfg/.aws/creds" }, CWD, POLICY).block).toBe(true);
  });

  test("edit hashline section headers are checked", () => {
    expect(decide("edit", { input: "[.env#A1B2]\nPUT 1.=1:\n+x" }, CWD, POLICY).block).toBe(true);
    expect(decide("edit", { input: "[main.tf#A1B2]\nPUT 1.=1:\n+x" }, CWD, POLICY).block).toBe(
      false,
    );
  });
});

describe("decide — executable text", () => {
  test("blocks denied command heads, including wrapped ones", () => {
    expect(decide("bash", { command: "rm -rf /tmp/x" }, CWD, POLICY).block).toBe(true);
    expect(decide("bash", { command: "sudo rm -rf /tmp/x" }, CWD, POLICY).block).toBe(true);
    expect(decide("bash", { command: "TZ=UTC rm -rf /tmp/x" }, CWD, POLICY).block).toBe(true);
    expect(decide("bash", { command: "ls | rm -rf /tmp/x" }, CWD, POLICY).block).toBe(true);
    expect(decide("bash", { command: "op read op://v/i/f" }, CWD, POLICY).block).toBe(true);
    expect(decide("bash", { command: "kubectl apply -f x.yaml" }, CWD, POLICY).block).toBe(true);
  });

  test("allows safe neighbours of denied heads", () => {
    expect(decide("bash", { command: "kubectl get pods" }, CWD, POLICY).block).toBe(false);
    expect(decide("bash", { command: "git push --force-with-lease" }, CWD, POLICY).block).toBe(
      false,
    );
    expect(decide("bash", { command: "tofu plan -no-color" }, CWD, POLICY).block).toBe(false);
  });

  test("blocks denied paths reached through bash or eval", () => {
    expect(decide("bash", { command: "wc -l < ./.env" }, CWD, POLICY).block).toBe(true);
    expect(
      decide("eval", { language: "py", code: "open('.env').read()" }, CWD, POLICY).block,
    ).toBe(true);
  });

  test("ordinary code is not flagged", () => {
    expect(
      decide("eval", { language: "js", code: "console.log(process.env.HOME)" }, CWD, POLICY).block,
    ).toBe(false);
    expect(
      decide("eval", { language: "py", code: "print(sum(range(10)))" }, CWD, POLICY).block,
    ).toBe(false);
  });

  test("block reason names the offending target and the rule", () => {
    const d = decide("read", { path: ".env" }, CWD, POLICY);
    expect(d.reason).toContain(".env");
    expect(d.reason).toContain("Read(**/.env*)");
  });
});

describe("redact", () => {
  test("replaces secret shapes with labelled placeholders", () => {
    const key = ["AKIA", "IOSFODNN7EXAMPLE"].join("");
    const gh = ["ghp", "_", "abcdefghijklmnopqrstuvwxyz0123"].join("");
    const jwt = ["eyJhbGciOiJIUzI1NiI", "eyJzdWIiOiIxMjM0NTY", "SflKxwRJSMeKKF2QT4"].join(".");
    const pem = `-----BEGIN RSA PRIVATE KEY-----\nMIIEowIBAAKC\n-----END RSA PRIVATE KEY-----`;
    const out = redact([key, gh, jwt, pem].join("\n"));

    expect(out.hits).toContain("AWS ACCESS KEY ID");
    expect(out.hits).toContain("GITHUB TOKEN");
    expect(out.hits).toContain("JWT");
    expect(out.hits).toContain("PRIVATE KEY");
    expect(out.text).not.toContain(key);
    expect(out.text).not.toContain(gh);
    expect(out.text).not.toContain(jwt);
    expect(out.text).not.toContain("MIIEowIBAAKC");
  });

  test("leaves ordinary output untouched", () => {
    const text = "obj.key = process.env.HOME; sk-not-a-key";
    const out = redact(text);
    expect(out.hits).toHaveLength(0);
    expect(out.text).toBe(text);
  });
});

test("policy loads from the live Claude settings without throwing", () => {
  const live = buildPolicy(
    ["Read(**/.env*)", "Bash(rm -rf *)"],
    os.homedir(),
  );
  expect(live.readGlobs).toHaveLength(1);
  expect(live.bash).toHaveLength(1);
});
