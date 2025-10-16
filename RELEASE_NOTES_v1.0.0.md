# 🚀 GitHub Mass Unfollow Tool v1.0.0

## Release Highlights

**The first stable release of GitHub Mass Unfollow Tool is here!** 🎉

This cross-platform tool helps you clean up your GitHub following list by automatically unfollowing users who don't follow you back, with safety features and beautiful output.

## ✨ What's New

### 🌍 Multi-Platform Support
- **Windows PowerShell** version with native Windows experience
- **Linux/macOS Bash** version with POSIX compliance
- Consistent functionality across all platforms

### 🛡️ Safety-First Design
- **Dry Run Mode**: Preview changes before executing
- **Confirmation Prompts**: Never unfollow without your consent
- **Rate Limiting**: Respects GitHub API limits (1 req/sec)
- **Batch Processing**: Limit unfollows per run

### 🎨 Beautiful User Experience
- Colorful progress bars and status indicators
- Real-time statistics and follower ratios
- Clear error messages and troubleshooting guidance
- Detailed output showing exactly what's happening

### ⚙️ Advanced Features
- **Smart Detection**: Efficiently identifies non-followers
- **Progress Tracking**: Shows real-time progress with ETA
- **Error Recovery**: Graceful handling of API failures
- **Flexible Configuration**: Customizable unfollow limits

## 📦 Downloads

### 🪟 Windows (PowerShell)
```powershell
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/M41k0n-Mk/github-mass-unfollow/v1.0.0/github-mass-unfollow-windows.ps1" -OutFile "github-mass-unfollow.ps1"
```

### 🐧 Linux / 🍎 macOS (Bash)
```bash
curl -O https://raw.githubusercontent.com/M41k0n-Mk/github-mass-unfollow/v1.0.0/github-mass-unfollow-linux.sh
chmod +x github-mass-unfollow-linux.sh
```

## 🔧 System Requirements

### Windows
- Windows 10/11 or Windows Server 2019+
- PowerShell 5.1+ (included)
- GitHub CLI

### Linux
- Any modern Linux distribution
- Bash 4.0+, jq, bc
- GitHub CLI

### macOS
- macOS 10.15+
- Bash/zsh, jq (via Homebrew)
- GitHub CLI

## 🚀 Quick Start

1. **Install GitHub CLI**: Follow the [installation guide](https://cli.github.com/)
2. **Get GitHub Token**: Create a [Personal Access Token](https://github.com/settings/tokens) with `user` scope
3. **Download Script**: Use the platform-specific download command above
4. **Run Dry Run**: Always test first with `--dry-run` or `-DryRun`
5. **Execute**: Run the actual unfollow process

## 📊 Example Usage

```bash
# Always start with a dry run!
GITHUB_TOKEN=your_token ./github-mass-unfollow-linux.sh --dry-run

# Process in safe batches
GITHUB_TOKEN=your_token ./github-mass-unfollow-linux.sh --max-unfollows 50

# Full execution (use with caution)
GITHUB_TOKEN=your_token ./github-mass-unfollow-linux.sh
```

## 🛡️ Safety Features

- ✅ **Confirmation required** before any unfollows
- ✅ **Dry run mode** for testing
- ✅ **Rate limiting** to prevent API abuse
- ✅ **Progress tracking** with interrupt safety
- ✅ **Error handling** with helpful messages
- ✅ **Batch processing** to limit scope

## 📈 Performance

- **Small accounts** (< 100 following): 1-2 minutes
- **Medium accounts** (100-1000 following): 5-15 minutes  
- **Large accounts** (1000+ following): 20+ minutes
- **Rate**: 1 request/second (GitHub API compliant)

## 🐛 Bug Fixes

This release includes fixes for:
- Linux script authentication flow issues
- PowerShell execution policy compatibility
- Enhanced error handling for various edge cases
- Improved cross-platform compatibility

## 🔍 Known Limitations

- Cannot automatically re-follow users (by design)
- Requires GitHub CLI installation and setup
- Respects GitHub API rate limits (1 req/sec)
- Token must have `user` scope permissions

## 📚 Documentation

- **Complete README**: Comprehensive setup and usage guide
- **Troubleshooting Section**: Solutions for common issues
- **FAQ**: Answers to frequently asked questions
- **Installation Guides**: Platform-specific setup instructions

## 🤝 Contributing

We welcome contributions! Please:
1. Fork the repository
2. Create a feature branch
3. Submit a pull request

## 📄 License

MIT License - see [LICENSE](LICENSE) for details

## 🙏 Acknowledgments

- GitHub CLI team for the excellent command-line tool
- Community feedback that helped shape this tool
- Beta testers who helped identify and fix issues

## 🔮 What's Next

Future versions will include:
- GitHub Actions integration for automated cleanup
- Docker container for easy deployment
- Additional filtering options (by activity, account age, etc.)
- Bulk re-follow functionality
- Web interface option

---

## 📥 Installation Commands

### One-liner for Windows:
```powershell
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/M41k0n-Mk/github-mass-unfollow/v1.0.0/github-mass-unfollow-windows.ps1" -OutFile "github-mass-unfollow.ps1"; Set-ExecutionPolicy -ExecutionPolicy RemoteSigned -Scope CurrentUser
```

### One-liner for Linux/macOS:
```bash
curl -O https://raw.githubusercontent.com/M41k0n-Mk/github-mass-unfollow/v1.0.0/github-mass-unfollow-linux.sh && chmod +x github-mass-unfollow-linux.sh
```

## 🆘 Support

- 📖 [Read the Documentation](https://github.com/M41k0n-Mk/github-mass-unfollow#readme)
- 🐛 [Report Issues](https://github.com/M41k0n-Mk/github-mass-unfollow/issues)
- 💬 [Join Discussions](https://github.com/M41k0n-Mk/github-mass-unfollow/discussions)
- ⭐ [Star the Repository](https://github.com/M41k0n-Mk/github-mass-unfollow)

---

**Happy unfollowing! 🎉**

*Remember: Always start with `--dry-run` to preview changes before making them permanent.*