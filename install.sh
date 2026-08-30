#!/usr/bin/env bash
# One command installs every skill on any machine or Claude Code cloud session:
#   git clone --depth 1 https://github.com/meetpatek3/skills /tmp/meet-skills && bash /tmp/meet-skills/install.sh
set -uo pipefail

scope="-g"
[ "${CLAUDE_CODE_REMOTE:-}" = "true" ] && scope=""

npx -y skills add meetpatek3/skills $scope --all || echo "warn: skills install failed"

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  npx -y plugins add vercel/vercel-plugin -y || echo "warn: vercel plugin install failed"
fi

echo "Done. Machines update later with: npx skills update -g -y"
exit 0
