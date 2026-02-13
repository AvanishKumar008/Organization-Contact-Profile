# GitHub Issues Setup Guide

This guide explains how to create and manage BR, NFR, Story, and Task issues in GitHub for the Organization-Contact-Profile project.

---

## 1. Create Issues (One-Time Setup)

Run the script to create all issues:

```bash
# Option A: Using Personal Access Token
# Create token at https://github.com/settings/tokens (scope: repo)
export GITHUB_TOKEN=ghp_your_token_here
./scripts/create-github-issues.sh

# Option B: Using GitHub CLI (if installed)
gh auth login
export GITHUB_TOKEN=$(gh auth token)
./scripts/create-github-issues.sh
```

**Prerequisites:** `jq` must be installed (`brew install jq` on Mac).

**Creates:**
- 10 BR issues (BR-001 to BR-010)
- 10 NFR issues (NFR-001 to NFR-010)
- 10 Story issues (STORY-001 to STORY-010)
- Labels: `BR`, `NFR`, `Story`, `Task`, `priority-must`, `priority-should`, `status-todo`, `status-in-progress`, `status-done`

**Tasks** are embedded as checklists within each Story issue.

---

## 2. Status Labels

| Label | Use When |
|-------|----------|
| `status-todo` | Not started |
| `status-in-progress` | Actively being worked on |
| `status-done` | Completed |

**Update status:** Edit the issue, add/remove the appropriate label.

---

## 3. Development Workflow with Issues

1. **Pick a Story** – Filter issues by label `Story`, find one with `status-todo`
2. **Start work** – Add label `status-in-progress`, create branch `feature/STORY-XXX-description`
3. **Open PR** – Reference the story: `[STORY-001] Add Summary and Headline to Contact`
4. **Complete** – After merge, add label `status-done`, check off task items

---

## 4. Linking PRs to Issues

In your PR title or description, include the issue reference:
- `Closes #12` (if Story is issue #12)
- Or `[STORY-001]` in the title

GitHub will auto-link the PR to the issue.

---

## 5. Issue Labels Reference

| Label | Purpose |
|-------|---------|
| `BR` | Business Requirement |
| `NFR` | Non-Functional Requirement |
| `Story` | User Story (implementation unit) |
| `Task` | Sub-task (optional; usually in Story checklist) |
| `priority-must` | Must Have |
| `priority-should` | Should Have |
