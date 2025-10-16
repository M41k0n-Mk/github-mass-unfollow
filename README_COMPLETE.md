# 🚀 GitHub Mass Unfollow Tool

> **Clean up your GitHub following list by automatically unfollowing users who don't follow you back.**

[![GitHub Stars](https://img.shields.io/github/stars/M41k0n-Mk/github-mass-unfollow?style=social)](https://github.com/M41k0n-Mk/github-mass-unfollow/stargazers)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Multi-Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Linux%20%7C%20macOS-blue.svg)](https://github.com/M41k0n-Mk/github-mass-unfollow)
[![Version](https://img.shields.io/badge/Version-v1.0.0-green.svg)](https://github.com/M41k0n-Mk/github-mass-unfollow/releases)

## ✨ Features

- 🎯 **Smart Detection**: Automatically finds users you follow who don't follow back
- 🛡️ **Safe Operation**: Built-in confirmation prompts and rate limiting
- 📋 **Dry Run Mode**: Preview what would be unfollowed without making changes
- 📊 **Detailed Statistics**: Shows follower ratios and account analytics
- 🚀 **Fast & Efficient**: Uses GitHub CLI for optimal performance
- 🎨 **Beautiful Output**: Colorful progress bars and clear status messages
- ⚙️ **Configurable**: Set maximum unfollow limits and other options
- 🌍 **Multi-Platform**: Works on Windows, Linux, and macOS

## 🚀 Quick Start

### Prerequisites

1. **GitHub CLI** installed ([Installation Guide](https://cli.github.com/))
2. **GitHub Personal Access Token** with proper permissions ([Setup Guide](#-github-token-setup))

### Platform-Specific Installation

#### 🪟 Windows (PowerShell)

```powershell
# Download the Windows version
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/M41k0n-Mk/github-mass-unfollow/main/github-mass-unfollow-windows.ps1" -OutFile "github-mass-unfollow.ps1"

# Set execution policy (if needed)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

#### 🐧 Linux / 🍎 macOS (Bash)

```bash
# Download the Linux/macOS version
curl -O https://raw.githubusercontent.com/M41k0n-Mk/github-mass-unfollow/main/github-mass-unfollow-linux.sh

# Make it executable
chmod +x github-mass-unfollow-linux.sh
```

## 🔐 GitHub Token Setup

### Step 1: Create Personal Access Token

1. Go to [GitHub Settings > Personal Access Tokens > Tokens (classic)](https://github.com/settings/tokens)
2. Click **"Generate new token (classic)"**
3. Give it a descriptive name (e.g., "Mass Unfollow Tool")
4. Set expiration (90 days recommended)

### Step 2: Required Permissions

**Minimum Required Scopes:**
- ✅ `user` - Access to user profile and following data
- ✅ `user:follow` - Ability to follow/unfollow users

**Recommended Scopes (for best compatibility):**
- ✅ `user` - User profile access
- ✅ `user:email` - Access to user email (some GitHub CLI operations)
- ✅ `user:follow` - Follow/unfollow operations
- ✅ `read:user` - Read user profile data

### Step 3: Save Your Token

6. Click **"Generate token"**
7. **Copy your token immediately** (starts with `ghp_`)
8. Store it securely - you won't be able to see it again!

## 📦 Installation Dependencies

### Install GitHub CLI

#### Windows
```powershell
# Using winget (Windows Package Manager)
winget install GitHub.cli

# Or using Chocolatey
choco install gh

# Or using Scoop
scoop install gh
```

#### macOS
```bash
# Using Homebrew
brew install gh

# Or using MacPorts
sudo port install gh
```

#### Linux (Ubuntu/Debian)
```bash
# Official method
curl -fsSL https://cli.github.com/packages/githubcli-archive-keyring.gpg | sudo dd of=/usr/share/keyrings/githubcli-archive-keyring.gpg
echo "deb [arch=$(dpkg --print-architecture) signed-by=/usr/share/keyrings/githubcli-archive-keyring.gpg] https://cli.github.com/packages stable main" | sudo tee /etc/apt/sources.list.d/github-cli.list > /dev/null
sudo apt update
sudo apt install gh

# Or using snap
sudo snap install gh
```

#### Linux (CentOS/RHEL/Fedora)
```bash
# Using dnf/yum
sudo dnf install gh
# or
sudo yum install gh

# Or using snap
sudo snap install gh
```

### Install Additional Dependencies (Linux/macOS only)

#### macOS
```bash
# Required dependencies
brew install jq

# Optional (usually pre-installed)
brew install bash
```

#### Linux (Ubuntu/Debian)
```bash
# Required dependencies
sudo apt install jq bc

# Usually pre-installed, but if needed:
sudo apt install bash curl
```

#### Linux (CentOS/RHEL/Fedora)
```bash
# Required dependencies
sudo dnf install jq bc
# or for older systems:
sudo yum install jq bc
```

## 📖 Usage Guide

### Step 1: Authenticate GitHub CLI (One-time setup)

```bash
# Using your token
echo "ghp_your_token_here" | gh auth login --with-token

# Or interactive login
gh auth login
```

### Step 2: Run the Tool

#### 🪟 Windows PowerShell

```powershell
# Set your token
$env:GITHUB_TOKEN = "ghp_your_token_here"

# Dry run first (HIGHLY RECOMMENDED)
.\github-mass-unfollow.ps1 -DryRun

# Execute with limit (safe approach)
.\github-mass-unfollow.ps1 -MaxUnfollows 10

# Unfollow all non-followers (use with caution)
.\github-mass-unfollow.ps1
```

#### 🐧 Linux / 🍎 macOS

```bash
# Set your token and run dry run (HIGHLY RECOMMENDED)
GITHUB_TOKEN=ghp_your_token_here ./github-mass-unfollow-linux.sh --dry-run

# Execute with limit (safe approach)
GITHUB_TOKEN=ghp_your_token_here ./github-mass-unfollow-linux.sh --max-unfollows 10

# Unfollow all non-followers (use with caution)
GITHUB_TOKEN=ghp_your_token_here ./github-mass-unfollow-linux.sh
```

## 🎯 Command Line Options

### Windows PowerShell Parameters

| Parameter | Description | Example |
|-----------|-------------|---------|
| `-DryRun` | Preview mode - show what would be done | `.\script.ps1 -DryRun` |
| `-MaxUnfollows N` | Limit unfollows to N users | `.\script.ps1 -MaxUnfollows 50` |
| `-Help` | Show help message | `.\script.ps1 -Help` |
| `-Version` | Show version info | `.\script.ps1 -Version` |

### Linux/macOS Bash Options

| Option | Description | Example |
|--------|-------------|---------|
| `--dry-run` | Preview mode - show what would be done | `./script.sh --dry-run` |
| `--max-unfollows N` | Limit unfollows to N users | `./script.sh --max-unfollows 50` |
| `--help` | Show help message | `./script.sh --help` |
| `--version` | Show version info | `./script.sh --version` |

## 🔧 Troubleshooting

### Common Issues and Solutions

#### 1. "GitHub CLI not found" Error

**Problem**: `gh: command not found` or similar error

**Solutions**:
```bash
# Check if GitHub CLI is installed
gh --version

# If not installed, install using the methods above
# For Windows:
winget install GitHub.cli

# For macOS:
brew install gh

# For Linux:
sudo apt install gh  # Ubuntu/Debian
sudo dnf install gh  # Fedora/RHEL
```

#### 2. Authentication Issues

**Problem**: "authentication failed" or "unauthorized" errors

**Solutions**:
```bash
# Check current auth status
gh auth status

# Re-authenticate with your token
echo "ghp_your_token_here" | gh auth login --with-token

# Or use interactive login
gh auth login

# Verify authentication works
gh api user
```

#### 3. Token Permission Issues

**Problem**: "Resource not accessible by integration" or similar API errors

**Solution**: Ensure your token has the correct scopes:
- Go to [GitHub Settings > Personal Access Tokens](https://github.com/settings/tokens)
- Edit your token
- Ensure these scopes are selected:
  - ✅ `user`
  - ✅ `user:follow`
  - ✅ `user:email` (recommended)

#### 4. Linux Script Dependencies Missing

**Problem**: `jq: command not found` or `bc: command not found`

**Solutions**:
```bash
# Ubuntu/Debian
sudo apt update && sudo apt install jq bc

# CentOS/RHEL/Fedora
sudo dnf install jq bc

# macOS
brew install jq
```

#### 5. PowerShell Execution Policy Issues

**Problem**: "execution of scripts is disabled on this system"

**Solutions**:
```powershell
# Check current policy
Get-ExecutionPolicy

# Set policy for current user (recommended)
Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser

# Or bypass for single execution
PowerShell -ExecutionPolicy Bypass -File .\github-mass-unfollow.ps1 -DryRun
```

#### 6. WSL (Windows Subsystem for Linux) Issues

**Problem**: Issues running Linux script on WSL

**Solutions**:
```bash
# Ensure line endings are correct
dos2unix github-mass-unfollow-linux.sh

# Make sure script is executable
chmod +x github-mass-unfollow-linux.sh

# Install dependencies in WSL
sudo apt update && sudo apt install gh jq bc
```

#### 7. Rate Limiting Issues

**Problem**: "API rate limit exceeded" errors

**Solutions**:
- The tool automatically handles rate limiting (1 request per second)
- If you still encounter issues, wait a few minutes and try again
- Consider using `--max-unfollows` to process in smaller batches

#### 8. Large Account Performance

**Problem**: Script is slow with thousands of followers/following

**Solutions**:
```bash
# Process in batches
./script.sh --max-unfollows 100

# Use dry run first to estimate time
./script.sh --dry-run

# Run during off-peak hours for better API performance
```

### Debug Mode

If you're still having issues, run in debug mode:

#### Windows
```powershell
# Add -Verbose flag
.\github-mass-unfollow.ps1 -DryRun -Verbose
```

#### Linux/macOS
```bash
# Add debug flags
bash -x ./github-mass-unfollow-linux.sh --dry-run
```

## 📊 Example Output

```
============================================
    GitHub Mass Unfollow Tool v1.0.0
============================================

🔐 Authenticating with GitHub...
👤 Getting user information...
✅ Authenticated as: John Doe (@johndoe)

📥 Fetching your followers...
✅ Found 1,234 followers
📤 Fetching users you follow...
✅ You follow 1,890 users

=== YOUR STATS ===
👥 Followers: 1,234
👤 Following: 1,890
📈 Follower Ratio: 0.65

🔍 Finding non-followers...
📋 Found 156 non-followers

👀 Preview (first 10):
  • user1
  • user2
  • inactive-account
  ...

Progress: [████████████████████████████████████████████████] 100% (156/156)
✅ Mass unfollow completed!

=== RESULTS ===
✅ Successfully unfollowed: 154
❌ Failed to unfollow: 2
📊 Total processed: 156

📈 Updated Stats:
👥 Followers: 1,234 (unchanged)
👤 Following: 1,736 (was 1,890)
📈 New Follower Ratio: 0.71 (was 0.65)

🎉 Thank you for using GitHub Mass Unfollow Tool!
```

## 🛡️ Safety Features

- **Confirmation Prompt**: Always asks before making changes
- **Rate Limiting**: 1 request per second to respect GitHub API limits
- **Dry Run Mode**: Test without making actual changes
- **Progress Tracking**: Real-time progress indicators
- **Error Handling**: Graceful handling of API errors
- **Cross-Platform**: Consistent behavior across all platforms
- **Batch Processing**: Option to limit unfollows per run

## 📋 System Requirements

### Windows
- Windows 10/11 or Windows Server 2019+
- PowerShell 5.1+ (included with Windows)
- GitHub CLI

### Linux
- Any modern Linux distribution
- Bash 4.0+
- GitHub CLI
- jq (JSON processor)
- bc (basic calculator)

### macOS
- macOS 10.15+
- Bash (or zsh)
- GitHub CLI
- jq (install via Homebrew)

## ❓ FAQ

### Is this safe to use?
Yes! The tool includes multiple safety features:
- Confirmation prompts before unfollowing
- Rate limiting to avoid API abuse
- Dry run mode to preview changes
- No access to private data beyond public follow relationships

### Will this get me banned from GitHub?
No. The tool respects GitHub's API rate limits and uses official GitHub CLI. It performs the same actions you could do manually through the web interface.

### Can I undo the unfollows?
The unfollowing action itself cannot be automatically undone, but you can manually re-follow users if needed. Always use `--dry-run` first to preview changes.

### What if I have thousands of followers?
The tool handles large accounts efficiently with pagination and progress tracking. For very large accounts, consider using the max unfollows option to process in batches.

### Why are there two different scripts?
We provide platform-optimized versions:
- **PowerShell version** for Windows users (native Windows experience)
- **Bash version** for Linux/macOS users (POSIX compliant)

Both versions have identical functionality but use platform-specific features for the best user experience.

### How long does it take to run?
Time depends on your account size:
- Small accounts (< 100 following): 1-2 minutes
- Medium accounts (100-1000 following): 5-15 minutes
- Large accounts (1000+ following): 20+ minutes

The tool processes 1 request per second to respect API limits.

### What happens if the script is interrupted?
The script can be safely interrupted (Ctrl+C). No partial unfollows occur - each unfollow operation is atomic. You can simply run the script again.

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

### Development Setup

```bash
# Clone the repository
git clone https://github.com/M41k0n-Mk/github-mass-unfollow.git

# Install dependencies (Linux/macOS)
sudo apt install gh jq bc  # Ubuntu/Debian
brew install gh jq         # macOS

# Test the scripts
./github-mass-unfollow-linux.sh --dry-run
```

## 📄 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## ⭐ Support

If this tool helped you clean up your GitHub following list, please consider:

- ⭐ **Starring this repository**
- 🐛 **Reporting issues** you encounter
- 💡 **Suggesting new features**
- 📢 **Sharing with others** who might find it useful

## 🔗 Related Projects

- [GitHub CLI](https://cli.github.com/) - Official GitHub command line tool
- [GitHub REST API](https://docs.github.com/en/rest) - Official GitHub API documentation

---

<div align="center">

**Made with ❤️ by [M41k0n-Mk](https://github.com/M41k0n-Mk)**

[⭐ Star this repo](https://github.com/M41k0n-Mk/github-mass-unfollow/stargazers) • [🐛 Report Bug](https://github.com/M41k0n-Mk/github-mass-unfollow/issues) • [💡 Request Feature](https://github.com/M41k0n-Mk/github-mass-unfollow/issues)

</div>