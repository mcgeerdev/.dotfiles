#!/usr/bin/env bash
set -euo pipefail

# CalVer format: YYYY.MM.COUNTER
# Examples: 2025.01.0, 2025.01.1, 2025.02.0

usage() {
  cat <<EOF
Usage: $(basename "$0") [OPTIONS]

Calculate CalVer versions based on git tags.

Options:
  --next      Output the next version (default)
  --current   Output the current/latest version tag
  --rc        Output next version with -rc suffix
  --validate  Validate a version string (pass as argument)
  -h, --help  Show this help

Examples:
  $(basename "$0")              # Next version: 2025.01.3
  $(basename "$0") --rc         # Next RC: 2025.01.3-rc
  $(basename "$0") --current    # Current tag: 2025.01.2
  $(basename "$0") --validate 2025.01.5  # Exit 0 if valid
EOF
}

get_current_tag() {
  git tag --list '[0-9][0-9][0-9][0-9].[0-9][0-9].[0-9]*' \
    | grep -E '^[0-9]{4}\.[0-9]{2}\.[0-9]+$' 2>/dev/null \
    | sort -t. -k1,1n -k2,2n -k3,3n \
    | tail -1 \
    || true  # Return empty string if no tags found (don't fail)
}

get_next_version() {
  local year month current_tag

  year=$(date -u +%Y)
  month=$(date -u +%m)

  current_tag=$(get_current_tag)

  if [[ -z "$current_tag" ]]; then
    echo "${year}.${month}.0"
    return
  fi

  local tag_year tag_month tag_counter
  IFS='.' read -r tag_year tag_month tag_counter <<< "$current_tag"

  if [[ "$tag_year" == "$year" && "$tag_month" == "$month" ]]; then
    echo "${year}.${month}.$((tag_counter + 1))"
  else
    echo "${year}.${month}.0"
  fi
}

validate_version() {
  local version="$1"
  [[ "$version" =~ ^[0-9]{4}\.[0-9]{2}\.[0-9]+(-rc)?$ ]]
}

main() {
  local mode="next"
  local rc_suffix=""

  while [[ $# -gt 0 ]]; do
    case "$1" in
      --next)
        mode="next"
        shift
        ;;
      --current)
        mode="current"
        shift
        ;;
      --rc)
        rc_suffix="-rc"
        shift
        ;;
      --validate)
        if [[ -z "${2:-}" ]]; then
          echo "Error: --validate requires a version argument" >&2
          exit 1
        fi
        if validate_version "$2"; then
          exit 0
        else
          echo "Invalid version format: $2" >&2
          exit 1
        fi
        ;;
      -h|--help)
        usage
        exit 0
        ;;
      *)
        echo "Unknown option: $1" >&2
        usage >&2
        exit 1
        ;;
    esac
  done

  case "$mode" in
    next)
      echo "$(get_next_version)${rc_suffix}"
      ;;
    current)
      get_current_tag
      ;;
  esac
}

main "$@"
