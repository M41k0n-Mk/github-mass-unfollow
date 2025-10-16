#!/bin/bash

# 🚀 GitHub Mass Unfollow Tool - Linux/macOS Version
# Clean up your GitHub following list by unfollowing users who don't follow you back
# Author: M41k0n-Mk
# Version: 1.0.0
# Repository: https://github.com/M41k0n-Mk/github-mass-unfollow

set -e

# Colors for beautiful output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
BLUE='\033[0;34m'
PURPLE='\033[0;35m'
CYAN='\033[0;36m'
GRAY='\033[0;37m'
NC='\033[0m' # No Color

# Banner
echo -e "${PURPLE}"
echo "============================================"
echo "    GitHub Mass Unfollow Tool v1.0.0"
echo "============================================"
echo -e "${NC}"

# Help function
show_help() {
    echo -e "${CYAN}GitHub Mass Unfollow Tool - Linux/macOS Version${NC}"
    echo ""
    echo -e "${YELLOW}Usage: $0 [OPTIONS]${NC}"
    echo ""
    echo -e "${GREEN}OPTIONS:${NC}"
    echo "  --dry-run              Show what would be unfollowed without actually doing it"
    echo "  --max-unfollows N      Maximum number of users to unfollow (default: unlimited)"
    echo "  --help                 Show this help message"
    echo "  --version              Show version information"
    echo ""
    echo -e "${GREEN}ENVIRONMENT VARIABLES:${NC}"
    echo "  GITHUB_TOKEN          Your GitHub Personal Access Token (required)"
    echo "                        Get one at: https://github.com/settings/tokens"
    echo "                        Required scopes: user:follow"
    echo ""
    echo -e "${GREEN}EXAMPLES:${NC}"
    echo "  # Dry run to see what would happen"
    echo "  GITHUB_TOKEN=ghp_xxx $0 --dry-run"
    echo ""
    echo "  # Unfollow maximum 10 users"
    echo "  GITHUB_TOKEN=ghp_xxx $0 --max-unfollows 10"
    echo ""
    echo "  # Unfollow all non-followers"
    echo "  GITHUB_TOKEN=ghp_xxx $0"
    echo ""
}

# Parse command line arguments
DRY_RUN=false
MAX_UNFOLLOWS=""

while [[ $# -gt 0 ]]; do
    case $1 in
        --dry-run)
            DRY_RUN=true
            shift
            ;;
        --max-unfollows)
            MAX_UNFOLLOWS="$2"
            shift 2
            ;;
        --help)
            show_help
            exit 0
            ;;
        --version)
            echo "GitHub Mass Unfollow Tool v1.0.0"
            echo "Repository: https://github.com/M41k0n-Mk/github-mass-unfollow"
            exit 0
            ;;
        *)
            echo -e "${RED}ERROR: Unknown option: $1${NC}"
            show_help
            exit 1
            ;;
    esac
done

# Check if GitHub token is provided
if [ -z "$GITHUB_TOKEN" ]; then
    echo -e "${RED}ERROR: GITHUB_TOKEN environment variable is required${NC}"
    echo ""
    echo -e "${YELLOW}To get a GitHub token:${NC}"
    echo "1. Go to https://github.com/settings/tokens"
    echo "2. Click 'Generate new token (classic)'"
    echo "3. Select scope: 'user' (for user:follow permission)"
    echo "4. Copy the token and run:"
    echo "   GITHUB_TOKEN=your_token_here $0 --dry-run"
    echo ""
    exit 1
fi

# Check if GitHub CLI is installed
if ! command -v gh &> /dev/null; then
    echo -e "${RED}ERROR: GitHub CLI (gh) is not installed${NC}"
    echo ""
    echo -e "${YELLOW}To install GitHub CLI:${NC}"
    echo "• macOS: brew install gh"
    echo "• Ubuntu/Debian: sudo apt install gh"
    echo "• CentOS/RHEL: sudo yum install gh"
    echo "• Arch Linux: sudo pacman -S github-cli"
    echo "• Or visit: https://cli.github.com/"
    echo ""
    exit 1
fi

# Check if jq is installed (for JSON parsing)
if ! command -v jq &> /dev/null; then
    echo -e "${RED}ERROR: jq is not installed (required for JSON parsing)${NC}"
    echo ""
    echo -e "${YELLOW}To install jq:${NC}"
    echo "• macOS: brew install jq"
    echo "• Ubuntu/Debian: sudo apt install jq"
    echo "• CentOS/RHEL: sudo yum install jq"
    echo "• Arch Linux: sudo pacman -S jq"
    echo ""
    exit 1
fi

echo -e "${BLUE}🔐 Authenticating with GitHub...${NC}"
echo "$GITHUB_TOKEN" | gh auth login --with-token 2>/dev/null || true

# Get current user info
echo -e "${BLUE}👤 Getting user information...${NC}"
USER_INFO=$(gh api user)
USERNAME=$(echo "$USER_INFO" | jq -r '.login')
DISPLAY_NAME=$(echo "$USER_INFO" | jq -r '.name // .login')

echo -e "${GREEN}✅ Authenticated as: ${DISPLAY_NAME} (@${USERNAME})${NC}"
echo ""

# Get followers with pagination
echo -e "${BLUE}📥 Fetching your followers...${NC}"
FOLLOWERS_TEMP=$(mktemp)
gh api --paginate "/user/followers" --jq '.[].login' | sort > "$FOLLOWERS_TEMP"
FOLLOWERS_COUNT=$(wc -l < "$FOLLOWERS_TEMP")
echo -e "${GREEN}✅ Found ${FOLLOWERS_COUNT} followers${NC}"

# Get following with pagination
echo -e "${BLUE}📤 Fetching users you follow...${NC}"
FOLLOWING_TEMP=$(mktemp)
gh api --paginate "/user/following" --jq '.[].login' | sort > "$FOLLOWING_TEMP"
FOLLOWING_COUNT=$(wc -l < "$FOLLOWING_TEMP")
echo -e "${GREEN}✅ You follow ${FOLLOWING_COUNT} users${NC}"

# Calculate statistics
echo ""
echo -e "${CYAN}=== YOUR STATS ===${NC}"
echo -e "👥 Followers: ${FOLLOWERS_COUNT}"
echo -e "👤 Following: ${FOLLOWING_COUNT}"

if [ "$FOLLOWING_COUNT" -gt 0 ]; then
    FOLLOW_RATIO=$(echo "scale=2; $FOLLOWERS_COUNT / $FOLLOWING_COUNT" | bc 2>/dev/null || echo "N/A")
    echo -e "📈 Follower Ratio: ${FOLLOW_RATIO}"
fi
echo ""

# Find non-followers
echo -e "${BLUE}🔍 Finding non-followers...${NC}"
NON_FOLLOWERS_TEMP=$(mktemp)
comm -23 "$FOLLOWING_TEMP" "$FOLLOWERS_TEMP" > "$NON_FOLLOWERS_TEMP"
NON_FOLLOWERS_COUNT=$(wc -l < "$NON_FOLLOWERS_TEMP")

if [ "$NON_FOLLOWERS_COUNT" -eq 0 ]; then
    echo -e "${GREEN}🎉 Amazing! Everyone you follow also follows you back!${NC}"
    echo -e "${GREEN}   Your account has perfect follower reciprocity! 💯${NC}"
    
    # Cleanup
    rm "$FOLLOWERS_TEMP" "$FOLLOWING_TEMP" "$NON_FOLLOWERS_TEMP"
    exit 0
fi

echo -e "${YELLOW}📋 Found ${NON_FOLLOWERS_COUNT} non-followers${NC}"

# Show preview of non-followers
echo ""
echo -e "${CYAN}👀 Preview (first 10):${NC}"
head -10 "$NON_FOLLOWERS_TEMP" | while read -r user; do
    echo -e "  • ${user}"
done

if [ "$NON_FOLLOWERS_COUNT" -gt 10 ]; then
    echo -e "  ... and $((NON_FOLLOWERS_COUNT - 10)) more"
fi

# Apply max limit if specified
ACTUAL_UNFOLLOW_COUNT=$NON_FOLLOWERS_COUNT
if [ ! -z "$MAX_UNFOLLOWS" ] && [ "$NON_FOLLOWERS_COUNT" -gt "$MAX_UNFOLLOWS" ]; then
    echo ""
    echo -e "${YELLOW}⚠️  Limiting to ${MAX_UNFOLLOWS} unfollows (found ${NON_FOLLOWERS_COUNT})${NC}"
    ACTUAL_UNFOLLOW_COUNT=$MAX_UNFOLLOWS
fi

# Dry run mode
if [ "$DRY_RUN" = "true" ]; then
    echo ""
    echo -e "${PURPLE}🔍 DRY RUN: Would unfollow ${ACTUAL_UNFOLLOW_COUNT} users${NC}"
    echo -e "${CYAN}Run without --dry-run to execute${NC}"
    
    # Cleanup
    rm "$FOLLOWERS_TEMP" "$FOLLOWING_TEMP" "$NON_FOLLOWERS_TEMP"
    exit 0
fi

# Confirmation prompt
echo ""
echo -e "${YELLOW}⚠️  This will unfollow ${ACTUAL_UNFOLLOW_COUNT} users who don't follow you back.${NC}"
echo -e "${YELLOW}   This action cannot be undone easily.${NC}"
echo ""
read -p "Are you sure you want to continue? (y/N): " -n 1 -r
echo ""

if [[ ! $REPLY =~ ^[Yy]$ ]]; then
    echo -e "${BLUE}🛑 Operation cancelled by user${NC}"
    rm "$FOLLOWERS_TEMP" "$FOLLOWING_TEMP" "$NON_FOLLOWERS_TEMP"
    exit 0
fi

# Start unfollowing process
echo ""
echo -e "${BLUE}🚀 Starting mass unfollow process...${NC}"
echo -e "${BLUE}   Rate limited to 1 request per second for API safety${NC}"
echo ""

UNFOLLOWED=0
FAILED=0
PROCESSED=0

# Progress tracking function
show_progress() {
    local current=$1
    local total=$2
    local width=50
    local percentage=$((current * 100 / total))
    local filled=$((current * width / total))
    
    printf "\r${CYAN}Progress: ["
    printf "%*s" $filled | tr ' ' '█'
    printf "%*s" $((width - filled)) | tr ' ' '░'
    printf "] %d%% (%d/%d)${NC}" $percentage $current $total
}

# Process each non-follower
while IFS= read -r user && [ "$PROCESSED" -lt "$ACTUAL_UNFOLLOW_COUNT" ]; do
    PROCESSED=$((PROCESSED + 1))
    
    # Show progress
    show_progress $PROCESSED $ACTUAL_UNFOLLOW_COUNT
    
    # Attempt to unfollow
    if gh api -X DELETE "/user/following/$user" >/dev/null 2>&1; then
        UNFOLLOWED=$((UNFOLLOWED + 1))
    else
        FAILED=$((FAILED + 1))
    fi
    
    # Rate limiting: GitHub allows 5000 requests per hour, being conservative
    sleep 1
    
done < "$NON_FOLLOWERS_TEMP"

# Final newline after progress bar
echo ""
echo ""

# Results summary
echo -e "${GREEN}✅ Mass unfollow completed!${NC}"
echo ""
echo -e "${CYAN}=== RESULTS ===${NC}"
echo -e "✅ Successfully unfollowed: ${UNFOLLOWED}"
echo -e "❌ Failed to unfollow: ${FAILED}"
echo -e "📊 Total processed: ${PROCESSED}"

if [ "$FAILED" -gt 0 ]; then
    echo ""
    echo -e "${YELLOW}⚠️  Some unfollows failed. This could be due to:${NC}"
    echo -e "   • Network issues"
    echo -e "   • Users who blocked you"
    echo -e "   • GitHub API rate limits"
    echo -e "   • Users who deactivated their accounts"
fi

# New follower stats
NEW_FOLLOWING_COUNT=$((FOLLOWING_COUNT - UNFOLLOWED))
if [ "$FOLLOWERS_COUNT" -gt 0 ] && [ "$NEW_FOLLOWING_COUNT" -gt 0 ]; then
    NEW_RATIO=$(echo "scale=2; $FOLLOWERS_COUNT / $NEW_FOLLOWING_COUNT" | bc 2>/dev/null || echo "N/A")
    echo ""
    echo -e "${CYAN}📈 Updated Stats:${NC}"
    echo -e "👥 Followers: ${FOLLOWERS_COUNT} (unchanged)"
    echo -e "👤 Following: ${NEW_FOLLOWING_COUNT} (was ${FOLLOWING_COUNT})"
    echo -e "📈 New Follower Ratio: ${NEW_RATIO} (was ${FOLLOW_RATIO})"
fi

echo ""
echo -e "${PURPLE}🎉 Thank you for using GitHub Mass Unfollow Tool!${NC}"
echo -e "${PURPLE}   Star this project: https://github.com/M41k0n-Mk/github-mass-unfollow${NC}"

# Cleanup temporary files
rm "$FOLLOWERS_TEMP" "$FOLLOWING_TEMP" "$NON_FOLLOWERS_TEMP"

exit 0