# Stories and Tasks

**Document Version:** 1.0  
**Project:** Organization-Contact-Profile  
**Last Updated:** February 2025

---

## 1. Story Overview

Stories are implementation units for development. Each story maps to one or more BR/NFR and is implemented via a single Pull Request.

---

## 2. Stories

### STORY-001: Contact Summary and Headline Fields

| Attribute | Description |
|-----------|-------------|
| **ID** | STORY-001 |
| **Title** | Add Summary and Headline to Contact |
| **BR** | BR-001 |
| **NFR** | NFR-001, NFR-003 |
| **Description** | Add custom fields Summary__c and Headline__c to the Contact object. Update Contact page layout. |
| **Acceptance Criteria** | • Summary__c (Long Text, 131072) on Contact<br>• Headline__c (Text, 255) on Contact<br>• Fields on Contact layout |
| **Tasks** | TASK-001-001, TASK-001-002 |

**Tasks:**
- **TASK-001-001:** Create Contact/fields/Summary__c.field-meta.xml and Headline__c.field-meta.xml
- **TASK-001-002:** Add fields to Contact layout

---

### STORY-002: Experience Object and Layout

| Attribute | Description |
|-----------|-------------|
| **ID** | STORY-002 |
| **Title** | Experience Object Setup and Layout |
| **BR** | BR-002 |
| **NFR** | NFR-001 |
| **Description** | Configure Experience__c object with page layout and related list on Contact. |
| **Acceptance Criteria** | • Experience__c with all fields deployed<br>• Page layout for Experience__c<br>• Related list "Experiences" on Contact layout |
| **Tasks** | TASK-002-001, TASK-002-002 |

**Tasks:**
- **TASK-002-001:** Verify Experience__c object and fields (already created)
- **TASK-002-002:** Create/update Experience layout; add related list to Contact layout

---

### STORY-003: Skill Master Object

| Attribute | Description |
|-----------|-------------|
| **ID** | STORY-003 |
| **Title** | Skill Master Object Setup |
| **BR** | BR-003 |
| **NFR** | NFR-001 |
| **Description** | Configure Skill__c object as shared master list with Category picklist. |
| **Acceptance Criteria** | • Skill__c with Name, Category__c, Description__c<br>• Category: Technical, Soft, Domain, Other<br>• Page layout and tab |
| **Tasks** | TASK-003-001 |

**Tasks:**
- **TASK-003-001:** Verify Skill__c; create layout and tab (if needed)

---

### STORY-004: Contact_Skill Junction

| Attribute | Description |
|-----------|-------------|
| **ID** | STORY-004 |
| **Title** | Contact_Skill Junction Object |
| **BR** | BR-004 |
| **NFR** | NFR-001 |
| **Description** | Configure Contact_Skill__c junction linking Contact to Skill with Proficiency. |
| **Acceptance Criteria** | • Contact_Skill__c with Contact__c, Skill__c, Proficiency__c<br>• Related list "Contact Skills" on Contact<br>• Proficiency: Beginner, Intermediate, Advanced, Expert |
| **Tasks** | TASK-004-001, TASK-004-002 |

**Tasks:**
- **TASK-004-001:** Verify Contact_Skill__c object (already created)
- **TASK-004-002:** Add related list to Contact layout

---

### STORY-005: Project Object with Public/Private Type

| Attribute | Description |
|-----------|-------------|
| **ID** | STORY-005 |
| **Title** | Project Object (Public/Private) |
| **BR** | BR-005 |
| **NFR** | NFR-001 |
| **Description** | Configure Project__c object with Type (Public/Private) and related list on Contact. |
| **Acceptance Criteria** | • Project__c with Contact__c, Type__c, Description__c, URL__c, dates<br>• Type__c: Public, Private<br>• Related list "Projects" on Contact |
| **Tasks** | TASK-005-001, TASK-005-002 |

**Tasks:**
- **TASK-005-001:** Verify Project__c object (already created)
- **TASK-005-002:** Create layout; add related list to Contact layout

---

### STORY-006: Event Object

| Attribute | Description |
|-----------|-------------|
| **ID** | STORY-006 |
| **Title** | Event Object |
| **BR** | BR-006 |
| **NFR** | NFR-001 |
| **Description** | Create Event__c object for events (conferences, talks, etc.). |
| **Acceptance Criteria** | • Event__c with Name, Event_Date__c, Description__c, URL__c, Location__c<br>• Page layout |
| **Tasks** | TASK-006-001 |

**Tasks:**
- **TASK-006-001:** Create Event__c object and fields

---

### STORY-007: Event_Participant Junction

| Attribute | Description |
|-----------|-------------|
| **ID** | STORY-007 |
| **Title** | Event_Participant Junction (Speaker, Volunteer, Organizer) |
| **BR** | BR-006 |
| **NFR** | NFR-001 |
| **Description** | Create Event_Participant__c junction linking Contact to Event with Role. |
| **Acceptance Criteria** | • Event_Participant__c with Event__c, Contact__c, Role__c, Topic__c<br>• Role: Speaker, Volunteer, Organizer, Panelist, Moderator<br>• Related list "Event Participants" on Contact |
| **Tasks** | TASK-007-001, TASK-007-002 |

**Tasks:**
- **TASK-007-001:** Create Event_Participant__c object and fields
- **TASK-007-002:** Add related list to Contact layout

---

### STORY-008: View Full Profile Action

| Attribute | Description |
|-----------|-------------|
| **ID** | STORY-008 |
| **Title** | View Full Profile Button/Action |
| **BR** | BR-007 |
| **NFR** | NFR-003 |
| **Description** | Add "View Full Profile" Quick Action or Custom Button on Contact that opens the Full Profile page. |
| **Acceptance Criteria** | • Action visible on Contact record<br>• Action opens Full Profile for the Contact |
| **Tasks** | TASK-008-001 |

**Tasks:**
- **TASK-008-001:** Create Quick Action or WebLink; add to Contact page

---

### STORY-009: Full Profile Lightning Page

| Attribute | Description |
|-----------|-------------|
| **ID** | STORY-009 |
| **Title** | Full Profile Lightning Record Page |
| **BR** | BR-008 |
| **NFR** | NFR-003 |
| **Description** | Create Lightning Record Page for Contact displaying Header, Summary, Experience, Skills, Projects, Events. |
| **Acceptance Criteria** | • Record page type for Contact<br>• Sections: Header (name, photo, headline), Summary, Experience, Skills, Projects, Events<br>• Use standard Record Detail and Related List components |
| **Tasks** | TASK-009-001, TASK-009-002 |

**Tasks:**
- **TASK-009-001:** Create Contact_Full_Profile.flexipage-meta.xml
- **TASK-009-002:** Assign Full Profile as default/primary page for Contact in app

---

### STORY-010: Remove or Deprecate Profile__c (Optional)

| Attribute | Description |
|-----------|-------------|
| **ID** | STORY-010 |
| **Title** | Deprecate Profile__c (Move to Contact) |
| **BR** | BR-001, BR-009 |
| **NFR** | NFR-002 |
| **Description** | Remove Profile__c object once Summary and Headline are on Contact. Migrate any existing data if applicable. |
| **Acceptance Criteria** | • Profile__c removed from metadata<br>• No references to Profile__c in layouts or pages |
| **Tasks** | TASK-010-001 |
| **Note** | Can be deferred if Profile__c retained for future use |

---

## 3. Story-to-PR Mapping

| Story | Branch Name | PR Title |
|-------|-------------|----------|
| STORY-001 | feature/STORY-001-contact-fields | [STORY-001] Add Summary and Headline to Contact |
| STORY-002 | feature/STORY-002-experience | [STORY-002] Experience object and layout |
| STORY-003 | feature/STORY-003-skill | [STORY-003] Skill master object |
| STORY-004 | feature/STORY-004-contact-skill | [STORY-004] Contact_Skill junction |
| STORY-005 | feature/STORY-005-project | [STORY-005] Project object (Public/Private) |
| STORY-006 | feature/STORY-006-event | [STORY-006] Event object |
| STORY-007 | feature/STORY-007-event-participant | [STORY-007] Event_Participant junction |
| STORY-008 | feature/STORY-008-view-full-profile | [STORY-008] View Full Profile action |
| STORY-009 | feature/STORY-009-full-profile-page | [STORY-009] Full Profile Lightning page |
| STORY-010 | feature/STORY-010-deprecate-profile | [STORY-010] Deprecate Profile__c |

---

## 4. Development Workflow

1. Create feature branch from `main`: `git checkout -b feature/STORY-XXX-description`
2. Implement story tasks
3. Commit with message: `[STORY-XXX] Description`
4. Push and create PR targeting `main`
5. CI validates deployment to scratch org
6. After validation passes and approval, merge to `main`
7. CI deploys to Developer org (optional post-merge step)
