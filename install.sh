#!/bin/bash
# Install agent-skills plugin into a project
# Usage: ./install.sh [project-path]

set -e

SKILLS_DIR="$(cd "$(dirname "$0")" && pwd)"
PROJECT="${1:-$(pwd)}"

if [ ! -d "$PROJECT" ]; then
  echo "Error: project path '$PROJECT' does not exist"
  exit 1
fi

echo "Installing agent-skills into: $PROJECT"

# GitHub Copilot: copy skills and agents into .github/
GITHUB_DIR="$PROJECT/.github"
mkdir -p "$GITHUB_DIR/agents"

for skill_dir in "$SKILLS_DIR/skills"/*/; do
  skill_name=$(basename "$skill_dir")
  mkdir -p "$GITHUB_DIR/skills/$skill_name"
  cp "$skill_dir/SKILL.md" "$GITHUB_DIR/skills/$skill_name/SKILL.md"
done

for agent in "$SKILLS_DIR/agents"/*.md; do
  cp "$agent" "$GITHUB_DIR/agents/"
done

echo "  ✓ Copied skills → $GITHUB_DIR/skills/"
echo "  ✓ Copied agents → $GITHUB_DIR/agents/"

# Claude Code: add plugin-dir to project settings
CLAUDE_SETTINGS="$PROJECT/.claude/settings.json"
if [ -f "$CLAUDE_SETTINGS" ]; then
  echo ""
  echo "  ℹ Claude Code: add plugin-dir to your launch command or settings:"
  echo "    claude --plugin-dir $SKILLS_DIR"
else
  mkdir -p "$PROJECT/.claude"
  if [ ! -f "$CLAUDE_SETTINGS" ]; then
    echo "  ℹ Claude Code: launch with:"
    echo "    claude --plugin-dir $SKILLS_DIR"
  fi
fi

echo ""
echo "Done. For Claude Code, launch with:"
echo "  claude --plugin-dir $SKILLS_DIR"
