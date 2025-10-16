# 🚀 GitHub Mass Unfollow Tool

> **Clean up your GitHub following list by automatically unfollowing users who don't follow you back.**

[![GitHub Stars](https://img.shields.io/github/stars/M41k0n-Mk/github-mass-unfollow?style=social)](https://github.com/M41k0n-Mk/github-mass-unfollow/stargazers)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Multi-Platform](https://img.shields.io/badge/Platform-Windows%20%7C%20Linux%20%7C%20macOS-blue.svg)](https://github.com/M41k0n-Mk/github-mass-unfollow)

## ✨ Features

- 🎯 **Smart Detection**: Automatically finds users you follow who don't follow back
- 🛡️ **Safe Operation**: Built-in confirmation prompts and rate limiting
- 🔍 **Dry Run Mode**: Preview what would be unfollowed without making changes
- 📊 **Detailed Statistics**: Shows follower ratios and account analytics  
- 🚀 **Fast & Efficient**: Uses GitHub CLI for optimal performance
- 🎨 **Beautiful Output**: Colorful progress bars and clear status messages
- ⚙️ **Configurable**: Set maximum unfollow limits and other options
- 🌍 **Multi-Platform**: Works on Windows, Linux, and macOS

## 🚀 Quick Start

### Prerequisites

1. **GitHub CLI** installed ([Installation Guide](https://cli.github.com/))
2. **GitHub Personal Access Token** with `user` scope ([Get one here](https://github.com/settings/tokens))

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

## 📖 Usage Guide

### Step 1: Get Your GitHub Token

1. Go to [GitHub Settings > Personal Access Tokens](https://github.com/settings/tokens)
2. Click **"Generate new token (classic)"**
3. Select the **`user`** scope (includes `user:follow`)
4. Click **"Generate token"**
5. Copy your token (starts with `ghp_`)

### Step 2: Run the Tool

#### 🪟 Windows PowerShell

```powershell
# Set your token
$env:GITHUB_TOKEN = "ghp_your_token_here"

# Dry run first (recommended)
.\github-mass-unfollow.ps1 -DryRun

# Execute with limit
.\github-mass-unfollow.ps1 -MaxUnfollows 10

# Unfollow all non-followers
.\github-mass-unfollow.ps1
```

#### 🐧 Linux / 🍎 macOS

```bash
# Set your token and run dry run
GITHUB_TOKEN=ghp_your_token_here ./github-mass-unfollow-linux.sh --dry-run

# Execute with limit
GITHUB_TOKEN=ghp_your_token_here ./github-mass-unfollow-linux.sh --max-unfollows 10

# Unfollow all non-followers
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

## 🔧 Installation Dependencies

### Install GitHub CLI

#### Windows
```powershell
winget install GitHub.cli
```

#### macOS
```bash
brew install gh
```

#### Linux (Ubuntu/Debian)
```bash
sudo apt install gh
```

#### Linux (CentOS/RHEL)
```bash
sudo yum install gh
```

### Install Additional Dependencies (Linux/macOS only)

#### macOS
```bash
brew install jq
```

#### Linux (Ubuntu/Debian)
```bash
sudo apt install jq bc
```

#### Linux (CentOS/RHEL)
```bash
sudo yum install jq bc
```

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

## 🤝 Contributing

Contributions are welcome! Please feel free to submit a Pull Request. For major changes, please open an issue first to discuss what you would like to change.

## 📝 License

This project is licensed under the MIT License - see the [LICENSE](LICENSE) file for details.

## ⭐ Support

If this tool helped you clean up your GitHub following list, please consider:

- ⭐ **Starring this repository**
- 🐛 **Reporting issues** you encounter
- 💡 **Suggesting new features**
- 🔄 **Sharing with others** who might find it useful

## 🔗 Related Projects

- [GitHub CLI](https://cli.github.com/) - Official GitHub command line tool
- [GitHub REST API](https://docs.github.com/en/rest) - Official GitHub API documentation

---

<div align="center">

**Made with ❤️ by [M41k0n-Mk](https://github.com/M41k0n-Mk)**

[⭐ Star this repo](https://github.com/M41k0n-Mk/github-mass-unfollow/stargazers) • [🐛 Report Bug](https://github.com/M41k0n-Mk/github-mass-unfollow/issues) • [💡 Request Feature](https://github.com/M41k0n-Mk/github-mass-unfollow/issues)

</div>