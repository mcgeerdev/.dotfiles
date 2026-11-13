#!/usr/bin/env bash
# Run a shell command in a herdr pane, wait for it, print the pane tail and
# exit with the command's status.
#   run-in-pane.sh <pane-id> <timeout-minutes> <command>
set -euo pipefail

pane=${1:?pane id}
minutes=${2:?timeout in minutes}
command=${3:?command}
lines=${SHIP_PRS_TAIL_LINES:-150}

token="ship-prs-done-$(date +%s)-$$"
herdr pane run "$pane" "$command; echo \"$token exit=\$?\"" >/dev/null
herdr pane wait-output "$pane" --regex "$token exit=[0-9]+" \
  --source recent-unwrapped --timeout "$((minutes * 60000))" >/dev/null

out=$(herdr pane read "$pane" --source recent-unwrapped --lines "$lines")
printf '%s\n' "$out"
status=$(printf '%s\n' "$out" | sed -n "s/.*$token exit=\([0-9][0-9]*\).*/\1/p" | tail -n 1)
exit "${status:-1}"
