#!/bin/bash
# Create a PR for a story branch
# Usage: GITHUB_TOKEN=<token> ./scripts/create-pr.sh <branch> <title> <body>
# Or: ./scripts/create-pr.sh <branch> <title> <body>  (uses gh if available)

set -e
REPO="AvanishKumar008/Organization-Contact-Profile"
API="https://api.github.com/repos/$REPO"

BRANCH="$1"
TITLE="$2"
BODY="$3"

if [ -z "$BRANCH" ] || [ -z "$TITLE" ]; then
  echo "Usage: $0 <branch> <title> [body]"
  exit 1
fi

if [ -z "$BODY" ]; then
  BODY="$TITLE"
fi

# Escape body for JSON
BODY_ESCAPED=$(echo "$BODY" | jq -Rs .)

if [ -n "$GITHUB_TOKEN" ]; then
  echo "Creating PR via API..."
  RESPONSE=$(curl -s -X POST \
    -H "Authorization: Bearer $GITHUB_TOKEN" \
    -H "Accept: application/vnd.github+json" \
    -H "X-GitHub-Api-Version: 2022-11-28" \
    "$API/pulls" \
    -d "{\"title\":\"$TITLE\",\"head\":\"$BRANCH\",\"base\":\"main\",\"body\":$BODY_ESCAPED}")
  URL=$(echo "$RESPONSE" | jq -r '.html_url // empty')
  if [ -n "$URL" ] && [ "$URL" != "null" ]; then
    echo "PR created: $URL"
  else
    echo "Error: $RESPONSE" | jq .
    exit 1
  fi
else
  echo "PR not created. To create via API, set GITHUB_TOKEN."
  echo "Or create manually: https://github.com/$REPO/compare/main...$BRANCH"
fi
