# skills

The single source of truth for my coding-agent skills. One command installs everything, on any machine or Claude Code cloud session, for every agent (Claude Code, Codex, Cursor, …).

## Install

```bash
git clone --depth 1 https://github.com/meetpatek3/skills /tmp/meet-skills && bash /tmp/meet-skills/install.sh
```

On a real machine this installs globally (`~/.agents/skills` + symlinks into each agent). In Claude Code cloud (`CLAUDE_CODE_REMOTE=true`) it installs project-scoped; the canopy repo runs it automatically via a SessionStart hook.

## Update

```bash
npx skills update -y
npx plugins add vercel/vercel-plugin -y
```

Updates pull from each skill's original repo (Matt Pocock, Anthropic, Vercel, …) — `install.sh` only records which sources I use.

## My own skills

Skills I author live in `skills/`. `install.sh` picks them up automatically once the first one exists (`npx skills init <name>` scaffolds one).
