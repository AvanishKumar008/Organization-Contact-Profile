# Pull Request Creation Guide

**Repo:** AvanishKumar008/Organization-Contact-Profile  
**Base branch:** `main`

Use `Resolves #<issue_number>` in the PR body to auto-close linked issues when the PR merges.  
See: https://docs.github.com/en/issues/tracking-your-work-with-issues/using-issues/linking-a-pull-request-to-an-issue

---

## PR URLs (click to create)

| Story | Branch | PR URL |
|-------|--------|--------|
| STORY-001 | feature/STORY-001-contact-fields | https://github.com/AvanishKumar008/Organization-Contact-Profile/compare/main...feature/STORY-001-contact-fields |
| STORY-002 | feature/STORY-002-experience | https://github.com/AvanishKumar008/Organization-Contact-Profile/compare/main...feature/STORY-002-experience |
| STORY-003 | feature/STORY-003-skill | https://github.com/AvanishKumar008/Organization-Contact-Profile/compare/main...feature/STORY-003-skill |
| STORY-004 | feature/STORY-004-contact-skill | https://github.com/AvanishKumar008/Organization-Contact-Profile/compare/main...feature/STORY-004-contact-skill |
| STORY-005 | feature/STORY-005-project | https://github.com/AvanishKumar008/Organization-Contact-Profile/compare/main...feature/STORY-005-project |
| STORY-006 | feature/STORY-006-event | https://github.com/AvanishKumar008/Organization-Contact-Profile/compare/main...feature/STORY-006-event |
| STORY-007 | feature/STORY-007-event-participant | https://github.com/AvanishKumar008/Organization-Contact-Profile/compare/main...feature/STORY-007-event-participant |
| STORY-008/009 | feature/STORY-008-009-full-profile | https://github.com/AvanishKumar008/Organization-Contact-Profile/compare/main...feature/STORY-008-009-full-profile |
| STORY-011/012/013 | feature/STORY-011-012-013-profile-cv | https://github.com/AvanishKumar008/Organization-Contact-Profile/compare/main...feature/STORY-011-012-013-profile-cv |

---

## Suggested PR Titles & Bodies

### STORY-001
**Title:** [STORY-001] Add Summary and Headline to Contact  
**Body:**
```markdown
Resolves #<STORY-001-issue>
Resolves #<BR-001-issue>

## Summary
Adds custom fields Summary__c and Headline__c to Contact for profile display.

## Changes
- Summary__c (Long Text)
- Headline__c (Text, 255)
- Fields on Contact layout
```

### STORY-002
**Title:** [STORY-002] Experience object and layout  
**Body:**
```markdown
Resolves #<STORY-002-issue>

## Summary
Configure Experience__c with page layout and related list on Contact.

## Changes
- Experience__c layout (Name auto-number EXP-{0000}, all fields)
- Related list on Contact
```

### STORY-003
**Title:** [STORY-003] Skill master object setup  
**Body:**
```markdown
Resolves #<STORY-003-issue>

## Summary
Skill__c page layout with Name, Category, Description.
```

### STORY-004
**Title:** [STORY-004] Contact_Skill junction object  
**Body:**
```markdown
Resolves #<STORY-004-issue>

## Summary
Contact_Skill__c layout and related list on Contact.
```

### STORY-005
**Title:** [STORY-005] Project object (Public/Private)  
**Body:**
```markdown
Resolves #<STORY-005-issue>

## Summary
Project__c layout and related list on Contact.
```

### STORY-006
**Title:** [STORY-006] Event object  
**Body:**
```markdown
Resolves #<STORY-006-issue>

## Summary
Event__c object and layout.
```

### STORY-007
**Title:** [STORY-007] Event_Participant junction  
**Body:**
```markdown
Resolves #<STORY-007-issue>

## Summary
Event_Participant__c with Role (Speaker, Volunteer, Organizer, etc.), related list on Contact.
```

### STORY-008/009
**Title:** [STORY-008/009] View Full Profile Quick Action and LWC  
**Body:**
```markdown
Resolves #<STORY-008-issue>
Resolves #<STORY-009-issue>

## Summary
View Full Profile Quick Action for Contact. Add to page via App Builder (see docs/VIEW_FULL_PROFILE_SETUP.md).
```

### STORY-011/012/013
**Title:** [STORY-011/012/013] Contact Profile CV - Timeline, Popup, Skills UI  
**Body:**
```markdown
Resolves #<STORY-011-issue>
Resolves #<STORY-012-issue>
Resolves #<STORY-013-issue>

## Summary
- contactProfileCv LWC: unified timeline (Experience + Projects)
- Detail popup on timeline click
- Unique Skills UI with proficiency styling
- Experience Name: AutoNumber
- Remove Contact FlexiPage (not required)
- VIEW_FULL_PROFILE_SETUP.md
```

---

## Merge Order

Merge in this sequence (each depends on the previous):

1. STORY-001
2. STORY-002 *(rebase onto main after STORY-001 merge if needed)*
3. STORY-003
4. STORY-004
5. STORY-005
6. STORY-006
7. STORY-007
8. STORY-008/009
9. STORY-011/012/013
