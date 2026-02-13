#!/bin/bash
# Create GitHub Issues for BR, NFR, Stories (Tasks are checklists in Stories)
# Usage: GITHUB_TOKEN=<your-token> ./scripts/create-github-issues.sh
# Token: https://github.com/settings/tokens (scope: repo)
# Or with gh: GITHUB_TOKEN=$(gh auth token) ./scripts/create-github-issues.sh

set -e
REPO="AvanishKumar008/Organization-Contact-Profile"
API="https://api.github.com/repos/$REPO"

if [ -z "$GITHUB_TOKEN" ]; then
  echo "Error: GITHUB_TOKEN environment variable is required."
  echo "Get a token from: https://github.com/settings/tokens (scope: repo)"
  exit 1
fi

if ! command -v jq &> /dev/null; then
  echo "Error: jq is required. Install with: brew install jq (Mac) or apt install jq (Linux)"
  exit 1
fi

AUTH="Authorization: Bearer $GITHUB_TOKEN"
ACCEPT="Accept: application/vnd.github+json"
X_GITHUB_API="X-GitHub-Api-Version: 2022-11-28"

create_label() {
  local name=$1 color=$2 desc=$3
  curl -s -X POST -H "$AUTH" -H "$ACCEPT" -H "$X_GITHUB_API" \
    "$API/labels" \
    -d "{\"name\":\"$name\",\"color\":\"$color\",\"description\":\"$desc\"}" \
    > /dev/null 2>&1 || true  # Ignore if label exists
}

create_issue() {
  local title="$1" body="$2" labels="$3"
  local json=$(jq -n \
    --arg title "$title" \
    --arg body "$body" \
    --arg labels "$labels" \
    '{title: $title, body: $body, labels: ($labels | split(",") | map(select(length>0)))}')
  curl -s -X POST -H "$AUTH" -H "$ACCEPT" -H "$X_GITHUB_API" \
    "$API/issues" \
    -d "$json"
}

# Create labels
echo "Creating labels..."
create_label "BR" "1d76db" "Business Requirement"
create_label "NFR" "0e8a16" "Non-Functional Requirement"
create_label "Story" "fbca04" "User Story"
create_label "Task" "c2e0c6" "Task"
create_label "priority-must" "b60205" "Must Have"
create_label "priority-should" "d4c5f9" "Should Have"
create_label "status-todo" "ededed" "To Do"
create_label "status-in-progress" "0075ca" "In Progress"
create_label "status-done" "0e8a16" "Done"
echo "Labels created."

# Create BR issues
echo "Creating BR issues..."
create_issue "BR-001: Profile Summary and Headline on Contact" \
"## Business Requirement

**ID:** BR-001
**Priority:** Must Have

### Description
The system shall store a professional summary (long text) and headline (short tagline) directly on the Contact record.

### Rationale
Provides a quick professional overview without requiring a separate Profile object.

### Acceptance Criteria
- [ ] Summary field accepts up to 131,072 characters
- [ ] Headline field accepts up to 255 characters
- [ ] Both fields visible on Contact record and Full Profile page

### Linked
- Story: STORY-001" \
"BR,priority-must,status-todo"

create_issue "BR-002: Work Experience per Contact" \
"## Business Requirement

**ID:** BR-002
**Priority:** Must Have

### Description
The system shall allow tracking of work experience for each Contact, including job title, company, start/end dates, current role indicator, and description.

### Acceptance Criteria
- [ ] Experience records linked to Contact via lookup
- [ ] Required fields: Title, Company
- [ ] Optional: Start Date, End Date, Is Current, Description
- [ ] Multiple experiences per Contact supported

### Linked
- Story: STORY-002" \
"BR,priority-must,status-todo"

create_issue "BR-003: Shared Skill Master List" \
"## Business Requirement

**ID:** BR-003
**Priority:** Must Have

### Description
The system shall maintain a single master list of Skills that can be referenced by all Contacts. Skills shall have a category (Technical, Soft, Domain, Other).

### Acceptance Criteria
- [ ] Skill object with Name, Category, Description
- [ ] One skill definition used by multiple Contacts
- [ ] Category picklist: Technical, Soft, Domain, Other

### Linked
- Story: STORY-003" \
"BR,priority-must,status-todo"

create_issue "BR-004: Contact-Skill Association with Proficiency" \
"## Business Requirement

**ID:** BR-004
**Priority:** Must Have

### Description
The system shall allow associating Contacts with Skills from the master list, with an optional proficiency level (Beginner, Intermediate, Advanced, Expert).

### Acceptance Criteria
- [ ] Junction object linking Contact and Skill
- [ ] Proficiency picklist: Beginner, Intermediate, Advanced, Expert
- [ ] Many-to-many: Contact can have many Skills; Skill used by many Contacts

### Linked
- Story: STORY-004" \
"BR,priority-must,status-todo"

create_issue "BR-005: Projects (Public/Private) per Contact" \
"## Business Requirement

**ID:** BR-005
**Priority:** Must Have

### Description
The system shall allow tracking of Projects per Contact, with a type indicating Public (open source, portfolio) or Private (confidential, NDA).

### Acceptance Criteria
- [ ] Project linked to Contact
- [ ] Type: Public or Private
- [ ] Optional: Description, URL, Start Date, End Date, Is Current
- [ ] Displayed on Full Profile with Type visible

### Linked
- Story: STORY-005" \
"BR,priority-must,status-todo"

create_issue "BR-006: Event Participation in Multiple Roles" \
"## Business Requirement

**ID:** BR-006
**Priority:** Must Have

### Description
The system shall support Events where multiple Contacts can participate. Each Contact-Event association shall have a role: Speaker, Volunteer, Organizer, Panelist, or Moderator.

### Acceptance Criteria
- [ ] Event object: Name, Event Date, Description, URL, Location
- [ ] Event_Participant junction: Event, Contact, Role, Topic
- [ ] Role: Speaker, Volunteer, Organizer, Panelist, Moderator
- [ ] One Event can have many Contacts; one Contact can participate in many Events

### Linked
- Stories: STORY-006, STORY-007" \
"BR,priority-must,status-todo"

create_issue "BR-007: View Full Profile Button on Contact" \
"## Business Requirement

**ID:** BR-007
**Priority:** Must Have

### Description
The system shall provide a \"View Full Profile\" action (button or Quick Action) on the Contact record that opens the complete profile view.

### Acceptance Criteria
- [ ] Action visible on Contact record page
- [ ] Action opens Full Profile (Lightning page)
- [ ] Full Profile displays for the selected Contact

### Linked
- Story: STORY-008" \
"BR,priority-must,status-todo"

create_issue "BR-008: Full Profile Page Layout" \
"## Business Requirement

**ID:** BR-008
**Priority:** Must Have

### Description
The Full Profile page shall display: Contact header (name, photo, headline), Summary, Experience related list, Skills (Contact Skills with proficiency), Projects, and Event participation.

### Acceptance Criteria
- [ ] Sections in order: Header, Summary, Experience, Skills, Projects, Events
- [ ] Use standard Lightning components where possible
- [ ] Related lists show correct Contact's data

### Linked
- Stories: STORY-008, STORY-009" \
"BR,priority-must,status-todo"

create_issue "BR-009: Prefer Standard Salesforce Features" \
"## Business Requirement

**ID:** BR-009
**Priority:** Should Have

### Description
The solution shall use standard Salesforce objects, components, and features wherever possible to minimize custom development and maintenance.

### Acceptance Criteria
- [ ] Contact (standard) as central record
- [ ] Standard Related List, Record Detail components
- [ ] Custom objects only where standard does not suffice" \
"BR,priority-should,status-todo"

create_issue "BR-010: Support Multiple Contacts" \
"## Business Requirement

**ID:** BR-010
**Priority:** Should Have

### Description
The data model and UI shall support multiple Contacts having full profiles without architectural changes.

### Acceptance Criteria
- [ ] All relationships filter by Contact
- [ ] No hard-coded Contact references
- [ ] Sharing model allows multi-user access" \
"BR,priority-should,status-todo"

echo "BR issues created."

# Create NFR issues
echo "Creating NFR issues..."

create_issue "NFR-001: Salesforce Metadata API / SFDX Deployment" \
"## Non-Functional Requirement

**ID:** NFR-001 | **Category:** Deployability

### Description
The solution shall be deployable using the Salesforce Metadata API and Salesforce CLI. All components shall be source-controlled in SFDX format.

### Acceptance Criteria
- [ ] All metadata in force-app/main/default/
- [ ] \`sf project deploy start\` succeeds
- [ ] No manual setup required beyond org authentication" \
"NFR,priority-must,status-todo"

create_issue "NFR-002: Configuration-Only Core Functionality" \
"## Non-Functional Requirement

**ID:** NFR-002 | **Category:** Maintainability

### Description
Core functionality shall be achieved through declarative configuration. No Apex, Visualforce, or LWC required for basic operation." \
"NFR,priority-should,status-todo"

create_issue "NFR-003: Lightning Experience Support" \
"## Non-Functional Requirement

**ID:** NFR-003 | **Category:** Compatibility

### Description
The solution shall be fully compatible with Lightning Experience." \
"NFR,priority-must,status-todo"

create_issue "NFR-004: Multi-Contact Data Model" \
"## Non-Functional Requirement

**ID:** NFR-004 | **Category:** Scalability

### Description
The data model shall support multiple Contacts with full profiles without schema changes." \
"NFR,priority-should,status-todo"

create_issue "NFR-005: Version Control and CI/CD" \
"## Non-Functional Requirement

**ID:** NFR-005 | **Category:** DevOps

### Description
All changes via version control (Git). PR triggers validation. Merge deploys to Developer org." \
"NFR,priority-must,status-todo"

create_issue "NFR-006: DevHub and Scratch Org for Validation" \
"## Non-Functional Requirement

**ID:** NFR-006 | **Category:** Infrastructure

### Description
PR validation shall create ephemeral scratch orgs for deployment validation." \
"NFR,priority-must,status-todo"

create_issue "NFR-007: Pull Request per Story" \
"## Non-Functional Requirement

**ID:** NFR-007 | **Category:** Process

### Description
Each story developed in feature branch and submitted as PR. PR must pass validation before merge." \
"NFR,priority-must,status-todo"

create_issue "NFR-008: Branch Protection on main" \
"## Non-Functional Requirement

**ID:** NFR-008 | **Category:** Security / Process

### Description
Main branch protected. PR required. CI validation status check required." \
"NFR,priority-must,status-todo"

create_issue "NFR-009: Consistent API Version" \
"## Non-Functional Requirement

**ID:** NFR-009 | **Category:** Compatibility

### Description
All metadata shall use consistent API version from sfdx-project.json." \
"NFR,priority-must,status-todo"

create_issue "NFR-010: In-Repo Documentation" \
"## Non-Functional Requirement

**ID:** NFR-010 | **Category:** Maintainability

### Description
BR, NFR, Solution Document, Project Plan, CI/CD maintained in docs/." \
"NFR,priority-should,status-todo"

echo "NFR issues created."

# Create Story issues
echo "Creating Story issues..."

create_issue "[STORY-001] Add Summary and Headline to Contact" \
"## User Story

**BR:** BR-001 | **NFR:** NFR-001, NFR-003

### Description
Add custom fields Summary__c and Headline__c to the Contact object. Update Contact page layout.

### Acceptance Criteria
- [ ] Summary__c (Long Text, 131072) on Contact
- [ ] Headline__c (Text, 255) on Contact
- [ ] Fields on Contact layout

### Tasks
- [ ] TASK-001-001: Create Contact/fields/Summary__c.field-meta.xml and Headline__c.field-meta.xml
- [ ] TASK-001-002: Add fields to Contact layout

### Branch
\`feature/STORY-001-contact-fields\`" \
"Story,status-todo"

create_issue "[STORY-002] Experience Object Setup and Layout" \
"## User Story

**BR:** BR-002 | **NFR:** NFR-001

### Description
Configure Experience__c object with page layout and related list on Contact.

### Tasks
- [ ] TASK-002-001: Verify Experience__c object and fields
- [ ] TASK-002-002: Create/update Experience layout; add related list to Contact layout

### Branch
\`feature/STORY-002-experience\`" \
"Story,status-todo"

create_issue "[STORY-003] Skill Master Object Setup" \
"## User Story

**BR:** BR-003 | **NFR:** NFR-001

### Description
Configure Skill__c object as shared master list with Category picklist.

### Tasks
- [ ] TASK-003-001: Verify Skill__c; create layout and tab

### Branch
\`feature/STORY-003-skill\`" \
"Story,status-todo"

create_issue "[STORY-004] Contact_Skill Junction Object" \
"## User Story

**BR:** BR-004 | **NFR:** NFR-001

### Description
Configure Contact_Skill__c junction linking Contact to Skill with Proficiency.

### Tasks
- [ ] TASK-004-001: Verify Contact_Skill__c object
- [ ] TASK-004-002: Add related list to Contact layout

### Branch
\`feature/STORY-004-contact-skill\`" \
"Story,status-todo"

create_issue "[STORY-005] Project Object (Public/Private)" \
"## User Story

**BR:** BR-005 | **NFR:** NFR-001

### Description
Configure Project__c object with Type (Public/Private) and related list on Contact.

### Tasks
- [ ] TASK-005-001: Verify Project__c object
- [ ] TASK-005-002: Create layout; add related list to Contact layout

### Branch
\`feature/STORY-005-project\`" \
"Story,status-todo"

create_issue "[STORY-006] Event Object" \
"## User Story

**BR:** BR-006 | **NFR:** NFR-001

### Description
Create Event__c object for events (conferences, talks, etc.).

### Tasks
- [ ] TASK-006-001: Create Event__c object and fields

### Branch
\`feature/STORY-006-event\`" \
"Story,status-todo"

create_issue "[STORY-007] Event_Participant Junction" \
"## User Story

**BR:** BR-006 | **NFR:** NFR-001

### Description
Create Event_Participant__c junction linking Contact to Event with Role.

### Tasks
- [ ] TASK-007-001: Create Event_Participant__c object and fields
- [ ] TASK-007-002: Add related list to Contact layout

### Branch
\`feature/STORY-007-event-participant\`" \
"Story,status-todo"

create_issue "[STORY-008] View Full Profile Button/Action" \
"## User Story

**BR:** BR-007 | **NFR:** NFR-003

### Description
Add \"View Full Profile\" Quick Action or Custom Button on Contact that opens the Full Profile page.

### Tasks
- [ ] TASK-008-001: Create Quick Action or WebLink; add to Contact page

### Branch
\`feature/STORY-008-view-full-profile\`" \
"Story,status-todo"

create_issue "[STORY-009] Full Profile Lightning Record Page" \
"## User Story

**BR:** BR-008 | **NFR:** NFR-003

### Description
Create Lightning Record Page for Contact displaying Header, Summary, Experience, Skills, Projects, Events.

### Tasks
- [ ] TASK-009-001: Add contactProfileCv LWC to Contact record page
- [ ] TASK-009-002: Assign Full Profile as default page for Contact

### Branch
\`feature/STORY-009-full-profile-page\`" \
"Story,status-todo"

create_issue "[STORY-010] Deprecate Profile__c (Optional)" \
"## User Story

**BR:** BR-001, BR-009 | **NFR:** NFR-002

### Description
Remove Profile__c object once Summary and Headline are on Contact. Migrate any existing data if applicable.

### Tasks
- [ ] TASK-010-001: Remove Profile__c from metadata; update references

### Branch
\`feature/STORY-010-deprecate-profile\`

**Note:** Can be deferred if Profile__c retained for future use." \
"Story,status-todo"

echo "Story issues created."
echo "Done! Check https://github.com/$REPO/issues"
echo ""
echo "Tip: Use labels to filter (BR, NFR, Story). Update status-todo to status-in-progress when working."
