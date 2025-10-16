# Changelog

All notable changes to this project will be documented in this file.

The format is based on [Keep a Changelog](https://keepachangelog.com/en/1.0.0/),
and this project adheres to [Semantic Versioning](https://semver.org/spec/v2.0.0.html).

## [1.0.0] - 2025-10-16

### Added
- Initial release of GitHub Mass Unfollow Tool
- Core functionality to unfollow non-followers
- Dry run mode for safe preview
- Beautiful colored output with progress bars
- Rate limiting for API safety
- Confirmation prompts for user safety
- Detailed statistics and follower ratio calculations
- Maximum unfollow limits option
- Comprehensive error handling
- Cross-platform compatibility (Linux, macOS, Windows with WSL)
- Full documentation and examples

### Features
- 🎯 Smart detection of users who don't follow back
- 🛡️ Safe operation with confirmation prompts and rate limiting
- 🔍 Dry run mode to preview changes without executing
- 📊 Detailed statistics showing follower ratios and improvements
- 🚀 Fast and efficient using GitHub CLI
- 🎨 Beautiful colored output with progress indicators
- ⚙️ Configurable options (max unfollows, dry run)
- 🔒 Secure token handling
- 📖 Comprehensive documentation

### Technical Details
- Uses GitHub CLI for API interactions
- Implements proper rate limiting (1 request/second)
- Handles pagination for large follower lists
- Provides detailed error messages and troubleshooting
- Cross-platform shell script compatibility
- Temporary file cleanup for security

### Documentation
- Complete README with usage examples
- Contributing guidelines
- MIT License
- Installation and setup instructions
- Troubleshooting guide
- FAQ section