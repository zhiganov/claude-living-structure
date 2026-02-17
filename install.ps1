# Install claude-living-structure for Claude Code

$ErrorActionPreference = "Stop"

$RepoUrl = "https://raw.githubusercontent.com/zhiganov/claude-living-structure/main"
$ClaudeDir = "$env:USERPROFILE\.claude"

Write-Host "Installing claude-living-structure..."

# Create directories
New-Item -ItemType Directory -Force -Path "$ClaudeDir\commands" | Out-Null

# Download command file
Invoke-WebRequest -Uri "$RepoUrl/living-structure.md" -OutFile "$ClaudeDir\commands\living-structure.md"
Write-Host "✓ Installed living-structure.md → ~/.claude/commands/"

# Download checklist
Invoke-WebRequest -Uri "$RepoUrl/living-structure-checklist.md" -OutFile "$ClaudeDir\living-structure-checklist.md"
Write-Host "✓ Installed living-structure-checklist.md → ~/.claude/"

Write-Host ""
Write-Host "Installation complete! Use /living-structure <project> in Claude Code to get started."
