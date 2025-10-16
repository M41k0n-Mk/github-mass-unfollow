# 🚀 GitHub Mass Unfollow Tool

> **Clean up your GitHub following list by automatically unfollowing users who don't follow you back.**

[![GitHub Stars](https://img.shields.io/github/stars/M41k0n-Mk/github-mass-unfollow?style=social)](https://github.com/M41k0n-Mk/github-mass-unfollow/stargazers)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](https://opensource.org/licenses/MIT)
[![Shell Script](https://img.shields.io/badge/Shell-Bash-green.svg)](https://www.gnu.org/software/bash/)
[![GitHub CLI](https://img.shields.io/badge/Uses-GitHub_CLI-blue.svg)](https://cli.github.com/)

## ✨ Features

- 🎯 **Smart Detection**: Automatically finds users you follow who don't follow back
- 🛡️ **Safe Operation**: Built-in confirmation prompts and rate limiting
- 🔍 **Dry Run Mode**: Preview what would be unfollowed without making changes
- 📊 **Detailed Statistics**: Shows follower ratios and account analytics  
- 🚀 **Fast & Efficient**: Uses GitHub CLI for optimal performance
- 🎨 **Beautiful Output**: Colorful progress bars and clear status messages
- ⚙️ **Configurable**: Set maximum unfollow limits and other options

## 🚀 Quick Start

### Prerequisites

1. **GitHub CLI** installed ([Installation Guide](https://cli.github.com/))
2. **GitHub Personal Access Token** with `user` scope ([Get one here](https://github.com/settings/tokens))

### Installation

```bash
# Download the script
curl -O https://raw.githubusercontent.com/M41k0n-Mk/github-mass-unfollow/main/github-mass-unfollow.sh

# Make it executable
chmod +x github-mass-unfollow.sh
```

### Usage

```bash
# Dry run to see what would happen (recommended first)
GITHUB_TOKEN=ghp_your_token_here ./github-mass-unfollow.sh --dry-run

# Unfollow all non-followers
GITHUB_TOKEN=ghp_your_token_here ./github-mass-unfollow.sh

# Limit to unfollowing maximum 10 users
GITHUB_TOKEN=ghp_your_token_here ./github-mass-unfollow.sh --max-unfollows 10
```

## 📖 Detailed Guide

### Step 1: Get Your GitHub Token

1. Go to [GitHub Settings > Personal Access Tokens](https://github.com/settings/tokens)
2. Click **"Generate new token (classic)"**
3. Select the **`user`** scope (includes `user:follow`)
4. Click **"Generate token"**
5. Copy your token (starts with `ghp_`)

### Step 2: Run the Tool

```bash
# Set your token and run
export GITHUB_TOKEN=ghp_your_token_here
./github-mass-unfollow.sh --dry-run
```

### Step 3: Review and Execute

If the dry run looks good, run without `--dry-run`:

```bash
./github-mass-unfollow.sh
```

## 🎯 Command Line Options

| Option | Description | Example |
|--------|-------------|---------|
| `--dry-run` | Preview mode - show what would be done | `./script.sh --dry-run` |
| `--max-unfollows N` | Limit unfollows to N users | `./script.sh --max-unfollows 50` |
| `--help` | Show help message | `./script.sh --help` |
| `--version` | Show version info | `./script.sh --version` |

## 📊 Example Output

```
🚀 GitHub Mass Unfollow Tool

✅ Authenticated as: John Doe (@johndoe)

📊 Your GitHub Stats:
  👥 Followers: 1,234
  👤 Following: 1,890
  📈 Follower Ratio: 0.65

📋 Found 156 non-followers

👀 Preview (first 10):
  • user1
  • user2
  • inactive-account
  ...

Progress: [████████████████████████████████████████████████] 100% (156/156)

✅ Mass unfollow completed!

📊 Final Results:
  ✅ Successfully unfollowed: 154
  ❌ Failed to unfollow: 2
  📊 Total processed: 156

📈 Updated Stats:
  👥 Followers: 1,234 (unchanged)
  👤 Following: 1,736 (was 1,890)
  📈 New Follower Ratio: 0.71 (was 0.65)
```

## 🛡️ Safety Features

- **Confirmation Prompt**: Always asks before making changes
- **Rate Limiting**: 1 request per second to respect GitHub API limits
- **Dry Run Mode**: Test without making actual changes
- **Progress Tracking**: Real-time progress bar
- **Error Handling**: Graceful handling of API errors
- **Temporary Files**: Clean automatic cleanup

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
The unfollowing action itself cannot be automatically undone, but you can manually re-follow users if needed. Consider using `--dry-run` first.

### What if I have thousands of followers?
The tool handles large accounts efficiently with pagination and progress tracking. For very large accounts, consider using `--max-unfollows` to process in batches.

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