# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-10-16

### 🎉 First Stable Release

The first production-ready release of GitHub Mass Unfollow Tool with full cross-platform support!

### ✨ Added
- **Multi-Platform Support**: Native versions for Windows PowerShell and Linux/macOS Bash
- **Core Functionality**: Automatically detect and unfollow users who don't follow back
- **Safety Features**:
  - 📋 Dry run mode for safe preview without making changes
  - ✅ Confirmation prompts before any unfollow operations
  - 🛡️ Rate limiting (1 request/second) to respect GitHub API limits
  - 🔢 Maximum unfollow limits to process in batches
- **User Experience**:
  - 🎨 Beautiful colored output with progress bars
  - 📊 Detailed statistics and follower ratio calculations
  - 📈 Before/after comparison showing improvements
  - 🚀 Real-time progress tracking with ETA
- **Error Handling**:
  - 🔧 Comprehensive error handling with helpful messages
  - 🩺 Detailed troubleshooting documentation
  - 🔄 Graceful recovery from API failures
- **Documentation**:
  - 📖 Complete setup and usage guide
  - 🔐 Detailed GitHub token configuration instructions
  - 🐛 Troubleshooting section covering common issues
  - ❓ FAQ section answering user questions

### 🛠️ Technical Features
- **GitHub CLI Integration**: Uses official GitHub CLI for optimal performance and security
- **Cross-Platform Compatibility**: 
  - Windows PowerShell version with native Windows features
  - Linux/macOS Bash version with POSIX compliance
- **Smart Pagination**: Efficiently handles large follower lists
- **Secure Token Handling**: Environment variable based token management
- **Memory Efficient**: Processes data in streams without loading everything into memory

### 🔧 Platform-Specific Features

#### Windows PowerShell Version
- Native PowerShell parameter handling
- Windows-style progress bars
- PowerShell execution policy compatibility
- Windows terminal color support

#### Linux/macOS Bash Version  
- POSIX-compliant shell scripting
- ANSI color escape sequences
- Unix-style command line options
- Compatible with bash 4.0+

### 🐛 Bug Fixes
- **Linux Authentication Flow**: Fixed issue where GitHub CLI authentication would cause script termination despite successful authentication
- **Cross-Platform Line Endings**: Ensured proper handling of different line ending formats
- **Error Code Handling**: Improved handling of non-zero exit codes from GitHub CLI operations
- **Permission Issues**: Added comprehensive guidance for PowerShell execution policies

### 📋 System Requirements

#### Windows
- Windows 10/11 or Windows Server 2019+
- PowerShell 5.1+ (included with Windows)
- GitHub CLI

#### Linux
- Any modern Linux distribution
- Bash 4.0+
- GitHub CLI, jq, bc

#### macOS
- macOS 10.15+
- Bash or zsh
- GitHub CLI, jq (via Homebrew)

### 🔐 Security Features
- No storage of sensitive data
- Environment variable based token handling
- Rate limiting to prevent API abuse
- Confirmation required for all destructive operations
- Dry run mode for safe testing

### 📈 Performance
- Handles accounts with thousands of followers efficiently
- 1 request per second rate limiting for API compliance
- Progress tracking with estimated completion time
- Optimized pagination for large datasets

### 🤝 Contributing Guidelines
- Established contribution workflow
- Code of conduct
- Issue templates
- Pull request guidelines

### 📄 Licensing
- MIT License for maximum compatibility
- Clear usage rights and limitations
- Attribution requirements

### 🎯 Usage Examples
```bash
# Safe preview (recommended first step)
./github-mass-unfollow-linux.sh --dry-run

# Process in batches
./github-mass-unfollow-linux.sh --max-unfollows 50

# Full execution
./github-mass-unfollow-linux.sh
```

### 🚀 Installation
```bash
# Linux/macOS
curl -O https://raw.githubusercontent.com/M41k0n-Mk/github-mass-unfollow/v1.0.0/github-mass-unfollow-linux.sh
chmod +x github-mass-unfollow-linux.sh

# Windows PowerShell
Invoke-WebRequest -Uri "https://raw.githubusercontent.com/M41k0n-Mk/github-mass-unfollow/v1.0.0/github-mass-unfollow-windows.ps1" -OutFile "github-mass-unfollow.ps1"
```

---

*This release represents months of development, testing, and refinement to create a safe, reliable, and user-friendly tool for GitHub users who want to clean up their following lists.*