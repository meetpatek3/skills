# skills

The single source of truth for my coding-agent skills. Every skill lives in this repo — browse them in [`.agents/skills/`](.agents/skills). [`upstream-lock.json`](upstream-lock.json) records where each one originally came from, so upstream updates still flow (see Update below). It uses that name because a root `skills-lock.json` makes the skills CLI treat this repo as a consumer instead of a source; [`manage.sh`](manage.sh) swaps it into place for add/update runs.

## Install (any machine, or Claude Code cloud)

```bash
git clone --depth 1 https://github.com/meetpatek3/skills /tmp/meet-skills && bash /tmp/meet-skills/install.sh
```

On a real machine this installs globally (`~/.agents/skills` + symlinks into Claude Code, Codex, Cursor, …) plus the Vercel plugin. In Claude Code cloud (`CLAUDE_CODE_REMOTE=true`) it installs project-scoped; the canopy repo runs it automatically via a SessionStart hook.

## Add a skill (from skills.sh or any GitHub repo)

```bash
# in a clone of this repo
./manage.sh add <owner/repo> -y
git add -A && git commit -m "feat: add <skill>" && git push
```

Skills I author myself go in [`skills/`](skills), one folder per skill with a `SKILL.md` (`npx skills init <name>` scaffolds one).

## Update

Two steps — refresh the repo from upstream, then machines pull from the repo:

```bash
# 1. in a clone of this repo: pull latest from each skill's original source
./manage.sh update -p -y
git add -A && git commit -m "chore: update skills" && git push

# 2. on each machine
npx skills update -g -y
```

Step 1's diff is the review point: skills run with full agent permissions, so eyeball what changed before committing.
