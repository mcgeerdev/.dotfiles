#!/usr/bin/env bash
# One local tilt stack at a time across every ship-prs worker.
#   tilt-lock.sh acquire <owner> [--wait SECS]   exit 0 held, 1 busy
#   tilt-lock.sh release <owner>                 exit 0 released, 1 held by someone else
#   tilt-lock.sh status                          prints owner and age, exit 1 when free
set -euo pipefail

lock="${SHIP_PRS_STATE_DIR:-$HOME/.local/state/ship-prs}/tilt.lock"
mkdir -p "$(dirname "$lock")"

usage() {
  echo "usage: $0 acquire <owner> [--wait SECS] | release <owner> | status" >&2
  exit 2
}

holder() { sed -n 's/^owner=//p' "$lock" 2>/dev/null; }

describe() {
  local since now
  since=$(sed -n 's/^since=//p' "$lock" 2>/dev/null)
  now=$(date +%s)
  echo "held by $(holder) for $(((now - since) / 60)) min (since $(date -r "$since" '+%F %T'))"
}

try_acquire() {
  (set -C && printf 'owner=%s\nsince=%s\n' "$1" "$(date +%s)" >"$lock") 2>/dev/null
}

cmd=${1:-}
case "$cmd" in
acquire)
  owner=${2:-}
  [[ -n $owner ]] || usage
  wait=0
  if [[ ${3:-} == --wait ]]; then wait=${4:?--wait needs seconds}; fi
  deadline=$(($(date +%s) + wait))
  if [[ $(holder) == "$owner" ]]; then
    echo "already held by $owner"
    exit 0
  fi
  until try_acquire "$owner"; do
    if (($(date +%s) >= deadline)); then
      echo "busy: $(describe)" >&2
      echo "A lock older than the longest tilt run is likely stale. Ask the User before deleting $lock." >&2
      exit 1
    fi
    sleep 15
  done
  echo "acquired by $owner"
  ;;
release)
  owner=${2:-}
  [[ -n $owner ]] || usage
  if [[ ! -e $lock ]]; then
    echo "already free"
    exit 0
  fi
  if [[ $(holder) != "$owner" ]]; then
    echo "not released: $(describe)" >&2
    exit 1
  fi
  rm -f "$lock"
  echo "released by $owner"
  ;;
status)
  if [[ -e $lock ]]; then
    describe
  else
    echo "free"
    exit 1
  fi
  ;;
*) usage ;;
esac
