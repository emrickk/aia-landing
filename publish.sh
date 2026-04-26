#!/usr/bin/env bash
# publish.sh — stage, commit, and push updates to GitHub Pages
# Usage:
#   ./publish.sh                      # auto timestamp message
#   ./publish.sh "Your commit message"
set -e

cd "$(dirname "$0")"

MSG="${1:-Update $(date +'%Y-%m-%d %H:%M')}"

git add -A

if git diff --cached --quiet; then
  echo "Nothing to publish — working tree is clean."
  exit 0
fi

git commit -m "$MSG"
git push

echo ""
echo "Published. GitHub Pages will redeploy in ~1 minute."
echo "Live at: https://emrickk.github.io/aia-landing/"
