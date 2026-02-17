#!/bin/bash
# Install claude-living-structure for Claude Code

set -e

REPO_URL="https://raw.githubusercontent.com/zhiganov/claude-living-structure/main"
CLAUDE_DIR="$HOME/.claude"

echo "Installing claude-living-structure..."

# Create directories
mkdir -p "$CLAUDE_DIR/commands"

# Download command file
curl -fsSL "$REPO_URL/living-structure.md" -o "$CLAUDE_DIR/commands/living-structure.md"
echo "✓ Installed living-structure.md → ~/.claude/commands/"

# Download checklist
curl -fsSL "$REPO_URL/living-structure-checklist.md" -o "$CLAUDE_DIR/living-structure-checklist.md"
echo "✓ Installed living-structure-checklist.md → ~/.claude/"

echo ""
echo "Installation complete! Use /living-structure <project> in Claude Code to get started."
