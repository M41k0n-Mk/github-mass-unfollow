# 🚀 GitHub Mass Unfollow Tool - Windows PowerShell Version
# Clean up your GitHub following list by unfollowing users who don't follow you back
# Author: M41k0n-Mk
# Version: 1.0.0
# Repository: https://github.com/M41k0n-Mk/github-mass-unfollow

param(
    [switch]$DryRun,
    [int]$MaxUnfollows = 0,
    [switch]$Help,
    [switch]$Version
)

function Show-Help {
    Write-Host "GitHub Mass Unfollow Tool - Windows PowerShell Version" -ForegroundColor Cyan
    Write-Host
    Write-Host "Usage: ./github-mass-unfollow.ps1 [OPTIONS]" -ForegroundColor Yellow
    Write-Host
    Write-Host "OPTIONS:" -ForegroundColor Green
    Write-Host "  -DryRun              Show what would be unfollowed without doing it"
    Write-Host "  -MaxUnfollows N      Maximum number of users to unfollow"
    Write-Host "  -Help                Show this help message"
    Write-Host "  -Version             Show version information"
    Write-Host
    Write-Host "EXAMPLES:" -ForegroundColor Green
    Write-Host '  $env:GITHUB_TOKEN="your_token"; ./github-mass-unfollow.ps1 -DryRun'
    Write-Host '  $env:GITHUB_TOKEN="your_token"; ./github-mass-unfollow.ps1 -MaxUnfollows 10'
}

if ($Help) {
    Show-Help
    exit 0
}

if ($Version) {
    Write-Host "GitHub Mass Unfollow Tool v1.0.0"
    exit 0
}

Write-Host "============================================" -ForegroundColor Magenta
Write-Host "    GitHub Mass Unfollow Tool v1.0.0" -ForegroundColor Magenta  
Write-Host "============================================" -ForegroundColor Magenta
Write-Host

# Check token
if (-not $env:GITHUB_TOKEN) {
    Write-Host "ERROR: GITHUB_TOKEN environment variable is required" -ForegroundColor Red
    Write-Host "Get token at: https://github.com/settings/tokens"
    Write-Host "Then run: " -NoNewline
    Write-Host '$env:GITHUB_TOKEN="your_token"; ./github-mass-unfollow.ps1 -DryRun' -ForegroundColor Green
    exit 1
}

# Check GitHub CLI
try {
    $null = Get-Command gh -ErrorAction Stop
} catch {
    Write-Host "ERROR: GitHub CLI not found. Install with: winget install GitHub.cli" -ForegroundColor Red
    exit 1
}

Write-Host "Authenticating with GitHub..." -ForegroundColor Blue
try {
    $env:GITHUB_TOKEN | gh auth login --with-token 2>$null
} catch {
    Write-Host "Authentication failed. Check your token." -ForegroundColor Red
    exit 1
}

# Get user info
Write-Host "Getting user information..." -ForegroundColor Blue
$userInfo = gh api user | ConvertFrom-Json
$username = $userInfo.login
Write-Host "Authenticated as: @$username" -ForegroundColor Green
Write-Host

# Get followers
Write-Host "Fetching followers..." -ForegroundColor Blue
$followers = @()
$page = 1
do {
    $pageData = gh api "/user/followers?page=$page" --jq '.[].login' 2>$null
    if ($pageData) {
        $followers += $pageData -split "`n" | Where-Object { $_ }
        $page++
    }
} while ($pageData -and $pageData.Count -gt 0)

$followersCount = $followers.Count
Write-Host "Found $followersCount followers" -ForegroundColor Green

# Get following
Write-Host "Fetching following..." -ForegroundColor Blue
$following = @()
$page = 1
do {
    $pageData = gh api "/user/following?page=$page" --jq '.[].login' 2>$null
    if ($pageData) {
        $following += $pageData -split "`n" | Where-Object { $_ }
        $page++
    }
} while ($pageData -and $pageData.Count -gt 0)

$followingCount = $following.Count
Write-Host "You follow $followingCount users" -ForegroundColor Green
Write-Host

# Stats
Write-Host "=== YOUR STATS ===" -ForegroundColor Cyan
Write-Host "Followers: $followersCount"
Write-Host "Following: $followingCount"
if ($followingCount -gt 0) {
    $ratio = [math]::Round($followersCount / $followingCount, 2)
    Write-Host "Ratio: $ratio"
}
Write-Host

# Find non-followers
Write-Host "Finding non-followers..." -ForegroundColor Blue
$nonFollowers = $following | Where-Object { $_ -notin $followers }
$nonFollowersCount = $nonFollowers.Count

if ($nonFollowersCount -eq 0) {
    Write-Host "Amazing! Everyone you follow also follows you back!" -ForegroundColor Green
    exit 0
}

Write-Host "Found $nonFollowersCount non-followers" -ForegroundColor Yellow
Write-Host

# Preview
Write-Host "Preview (first 10):" -ForegroundColor Cyan
for ($i = 0; $i -lt [math]::Min(10, $nonFollowersCount); $i++) {
    Write-Host "  - $($nonFollowers[$i])"
}
if ($nonFollowersCount -gt 10) {
    Write-Host "  ... and $($nonFollowersCount - 10) more"
}
Write-Host

# Apply limit
$actualCount = $nonFollowersCount
if ($MaxUnfollows -gt 0 -and $nonFollowersCount -gt $MaxUnfollows) {
    Write-Host "Limiting to $MaxUnfollows unfollows" -ForegroundColor Yellow
    $actualCount = $MaxUnfollows
    $nonFollowers = $nonFollowers[0..($MaxUnfollows-1)]
}

# Dry run
if ($DryRun) {
    Write-Host "DRY RUN: Would unfollow $actualCount users" -ForegroundColor Magenta
    Write-Host "Run without -DryRun to execute" -ForegroundColor Cyan
    exit 0
}

# Confirmation
Write-Host "This will unfollow $actualCount users. Continue? (y/N): " -NoNewline -ForegroundColor Yellow
$confirm = Read-Host
if ($confirm -notmatch '^[Yy]$') {
    Write-Host "Cancelled" -ForegroundColor Blue
    exit 0
}

# Execute
Write-Host
Write-Host "Starting mass unfollow..." -ForegroundColor Blue
$unfollowed = 0
$failed = 0

for ($i = 0; $i -lt $actualCount; $i++) {
    $user = $nonFollowers[$i]
    $percent = [math]::Round((($i + 1) / $actualCount) * 100)
    
    Write-Host "[$percent%] Unfollowing: $user" -ForegroundColor Gray
    
    try {
        gh api -X DELETE "/user/following/$user" 2>$null
        if ($LASTEXITCODE -eq 0) {
            $unfollowed++
        } else {
            $failed++
        }
    } catch {
        $failed++
    }
    
    Start-Sleep -Seconds 1
}

Write-Host
Write-Host "=== RESULTS ===" -ForegroundColor Green
Write-Host "Successfully unfollowed: $unfollowed"
Write-Host "Failed: $failed"
Write-Host "Total processed: $actualCount"
Write-Host
Write-Host "Thank you for using GitHub Mass Unfollow Tool!" -ForegroundColor Magenta
Write-Host "Star the project: https://github.com/M41k0n-Mk/github-mass-unfollow" -ForegroundColor Cyan