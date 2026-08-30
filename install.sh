#!/usr/bin/env bash
# One command installs every skill on any machine or Claude Code cloud session:
#   git clone --depth 1 https://github.com/meetpatek3/skills /tmp/meet-skills && bash /tmp/meet-skills/install.sh
set -uo pipefail

scope="-g"
[ "${CLAUDE_CODE_REMOTE:-}" = "true" ] && scope=""

add() {
  local repo="$1"; shift
  npx -y skills add "$repo" $scope -y "$@" || echo "warn: skills add $repo failed"
}

add mattpocock/skills --all
add anthropics/healthcare -s clinical-note-extract-skill clinical-trial-protocol-skill contracts doc-extract fhir fhir-developer-skill fraud-detection icd10-cm-skill prior-auth-review-skill procedure-coding
add shadcn/ui -s shadcn migrate-radix-to-base
add ueberdosis/tiptap -s tiptap
add microsoft/playwright-cli -s playwright-cli
add anthropics/skills -s frontend-design
add vercel-labs/skills -s find-skills

repo_dir="$(cd "$(dirname "$0")" && pwd)"
if find "$repo_dir/skills" -name SKILL.md -print -quit 2>/dev/null | grep -q .; then
  add "$repo_dir"
fi

if [ "${CLAUDE_CODE_REMOTE:-}" != "true" ]; then
  npx -y plugins add vercel/vercel-plugin -y || echo "warn: vercel plugin install failed"
fi

echo "Done. Update any time with: npx skills update -y && npx plugins add vercel/vercel-plugin -y"
exit 0
