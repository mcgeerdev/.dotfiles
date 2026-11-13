#!/usr/bin/env bash
# Stateless scope check for one ship-prs PR.
#   verify.sh <contract.md> <worktree> <diff-base> <verdict.json>
# Writes the verdict with the checked HEAD added, prints the summary, and exits
# 0 on pass, 1 on fail, 2 when the verifier output isn't valid JSON.
set -euo pipefail

contract=${1:?contract path}
worktree=${2:?worktree path}
base=${3:?diff base, e.g. origin/master or the parent branch}
verdict=${4:?verdict path}
skill_dir=$(cd "$(dirname "$0")/.." && pwd)

head=$(git -C "$worktree" rev-parse HEAD)
raw=$(mktemp -t ship-prs-verdict)

{
  cat "$skill_dir/prompts/verifier.md"
  printf '\n## Contract\n\n'
  cat "$contract"
  printf '\n\n## Diff (%s...HEAD, HEAD %s)\n\n```diff\n' "$base" "$head"
  git -C "$worktree" diff "$base...HEAD"
  printf '```\n'
} | (cd "$worktree" && omp -p --no-session \
  --config "$HOME/.omp/agent/worker.yml" \
  --model @review \
  --tools read,grep,glob) >"$raw"

# Keep the outermost JSON object in case the model wraps it in prose or a fence.
if ! jq -R -s --arg head "$head" \
  'capture("(?<j>\\{[\\s\\S]*\\})").j | fromjson | . + {head: $head}' \
  "$raw" >"$verdict.tmp" 2>/dev/null ||
  ! jq -e '.verdict == "pass" or .verdict == "fail"' "$verdict.tmp" >/dev/null; then
  rm -f "$verdict.tmp"
  echo "verifier output is not a valid verdict; raw output: $raw" >&2
  exit 2
fi
mv "$verdict.tmp" "$verdict"

jq -r '"verdict: \(.verdict) at \(.head[0:9])\n\(.summary)"' "$verdict"
jq -e '.verdict == "pass"' "$verdict" >/dev/null
