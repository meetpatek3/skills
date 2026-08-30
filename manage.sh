#!/usr/bin/env bash
# Run a skills CLI command against this repo's vendored skills, e.g.:
#   ./manage.sh update -p -y          # refresh all skills from their original repos
#   ./manage.sh add <owner/repo> -y   # vendor a new skill from skills.sh / GitHub
# The lockfile lives as upstream-lock.json because a root skills-lock.json
# hides the skills from `npx skills add meetpatek3/skills` installs.
set -euo pipefail
cd "$(dirname "$0")"
[ -f upstream-lock.json ] && mv upstream-lock.json skills-lock.json
trap '[ -f skills-lock.json ] && mv skills-lock.json upstream-lock.json' EXIT
npx -y skills "$@"
