# Pull Request Links and Creation Guide

Create PRs for each story and link to BR/NFR/Stories. Use the links below or run the create-pr script with `GITHUB_TOKEN`.

---

## STORY-001: Add Summary and Headline to Contact

**Branch:** `feature/STORY-001-contact-fields`  
**Create PR:** https://github.com/AvanishKumar008/Organization-Contact-Profile/compare/main...feature/STORY-001-contact-fields

**PR Title:** `[STORY-001] Add Summary and Headline to Contact`

**PR Body:**
```markdown
## Summary
Implements BR-001: Profile Summary and Headline on Contact

## Changes
- Add `Summary__c` (Long Text, 131072) to Contact
- Add `Headline__c` (Text, 255) to Contact  
- Add Professional Profile section to Contact layout with new fields

## Linked Requirements
- **BR:** BR-001
- **NFR:** NFR-001, NFR-003
- **Story:** STORY-001

## Tasks
- [x] TASK-001-001: Create Contact fields
- [x] TASK-001-002: Add fields to Contact layout
```

---

## STORY-002: Experience Object and Layout

**Branch:** `feature/STORY-002-experience`  
**Base:** `feature/STORY-001-contact-fields` (merge STORY-001 first, then rebase onto main)  
**Create PR:** https://github.com/AvanishKumar008/Organization-Contact-Profile/compare/feature/STORY-001-contact-fields...feature/STORY-002-experience

**PR Title:** `[STORY-002] Experience object and layout`

**PR Body:**
```markdown
## Summary
Implements BR-002: Work Experience per Contact

## Changes
- Create Experience__c page layout with all fields
- Add Experiences related list to Contact layout

## Linked Requirements
- **BR:** BR-002
- **NFR:** NFR-001
- **Story:** STORY-002

## Tasks
- [x] TASK-002-001: Verify Experience__c object and fields
- [x] TASK-002-002: Create Experience layout; add related list to Contact layout

## Note
Depends on STORY-001 (Contact layout). After STORY-001 merges, rebase onto main and update PR base.
```

---

## Create PRs via API

```bash
# Set your token: https://github.com/settings/tokens (scope: repo)
export GITHUB_TOKEN=ghp_xxx

# STORY-001
./scripts/create-pr.sh feature/STORY-001-contact-fields "[STORY-001] Add Summary and Headline to Contact" "$(cat <<'BODY'
Implements BR-001. Adds Summary__c and Headline__c to Contact.

**Linked:** BR-001, NFR-001, NFR-003, STORY-001
BODY
)"
```

---

## GitHub Issues Linking

If GitHub Issues exist (from `create-github-issues.sh`), add to PR description:
- `Closes #<issue-number>` - to auto-close when PR merges
- Or reference: `Relates to #XX` for traceability
