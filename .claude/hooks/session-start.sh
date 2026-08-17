#!/bin/bash
set -euo pipefail

# Only run in Claude Code on the web (remote) — containers here are ephemeral,
# so this reinstalls the ui-ux-pro-max design-intelligence skill (globally,
# outside this repo) at the start of every session instead of committing its
# ~4.8MB payload into the portfolio's git history.
if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  exit 0
fi

npm install -g ui-ux-pro-max-cli >/dev/null 2>&1
uipro init --ai claude --global --offline >/dev/null 2>&1 || true
