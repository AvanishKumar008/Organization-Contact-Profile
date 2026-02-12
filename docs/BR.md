# Business Requirements (BR)

**Document Version:** 1.0  
**Project:** Organization-Contact-Profile  
**Last Updated:** February 2025

---

## 1. Overview

This document captures the Business Requirements for the Organization-Contact-Profile Salesforce solution, which manages professional profiles for Contacts with Experience, Skills, Projects, and Event participation.

---

## 2. Business Requirements

### BR-001: Profile Summary and Headline

| Attribute | Description |
|-----------|-------------|
| **ID** | BR-001 |
| **Title** | Profile Summary and Headline on Contact |
| **Description** | The system shall store a professional summary (long text) and headline (short tagline) directly on the Contact record. |
| **Rationale** | Provides a quick professional overview without requiring a separate Profile object. |
| **Priority** | Must Have |
| **Acceptance Criteria** | • Summary field accepts up to 131,072 characters<br>• Headline field accepts up to 255 characters<br>• Both fields visible on Contact record and Full Profile page |

---

### BR-002: Work Experience Tracking

| Attribute | Description |
|-----------|-------------|
| **ID** | BR-002 |
| **Title** | Work Experience per Contact |
| **Description** | The system shall allow tracking of work experience for each Contact, including job title, company, start/end dates, current role indicator, and description. |
| **Rationale** | Enables display of professional work history on the profile. |
| **Priority** | Must Have |
| **Acceptance Criteria** | • Experience records linked to Contact via lookup<br>• Required fields: Title, Company<br>• Optional: Start Date, End Date, Is Current, Description<br>• Multiple experiences per Contact supported |

---

### BR-003: Shared Skill Library

| Attribute | Description |
|-----------|-------------|
| **ID** | BR-003 |
| **Title** | Shared Skill Master List |
| **Description** | The system shall maintain a single master list of Skills that can be referenced by all Contacts. Skills shall have a category (Technical, Soft, Domain, Other). |
| **Rationale** | Ensures consistency and reusability across profiles; avoids duplicate skill entries. |
| **Priority** | Must Have |
| **Acceptance Criteria** | • Skill object with Name, Category, Description<br>• One skill definition used by multiple Contacts<br>• Category picklist: Technical, Soft, Domain, Other |

---

### BR-004: Contact Skills with Proficiency

| Attribute | Description |
|-----------|-------------|
| **ID** | BR-004 |
| **Title** | Contact-Skill Association with Proficiency |
| **Description** | The system shall allow associating Contacts with Skills from the master list, with an optional proficiency level (Beginner, Intermediate, Advanced, Expert). |
| **Rationale** | Enables contacts to showcase skill level, not just skill name. |
| **Priority** | Must Have |
| **Acceptance Criteria** | • Junction object linking Contact and Skill<br>• Proficiency picklist: Beginner, Intermediate, Advanced, Expert<br>• Many-to-many: Contact can have many Skills; Skill used by many Contacts |

---

### BR-005: Public and Private Projects

| Attribute | Description |
|-----------|-------------|
| **ID** | BR-005 |
| **Title** | Projects (Public/Private) per Contact |
| **Description** | The system shall allow tracking of Projects per Contact, with a type indicating Public (open source, portfolio) or Private (confidential, NDA). |
| **Rationale** | Highlights project work while distinguishing shareable vs. confidential projects. |
| **Priority** | Must Have |
| **Acceptance Criteria** | • Project linked to Contact<br>• Type: Public or Private<br>• Optional: Description, URL, Start Date, End Date, Is Current<br>• Displayed on Full Profile with Type visible |

---

### BR-006: Event Participation

| Attribute | Description |
|-----------|-------------|
| **ID** | BR-006 |
| **Title** | Event Participation in Multiple Roles |
| **Description** | The system shall support Events where multiple Contacts can participate. Each Contact-Event association shall have a role: Speaker, Volunteer, Organizer, Panelist, or Moderator. |
| **Rationale** | Tracks speaking engagements, volunteer work, and event organization. |
| **Priority** | Must Have |
| **Acceptance Criteria** | • Event object: Name, Event Date, Description, URL, Location<br>• Event_Participant junction: Event, Contact, Role, Topic<br>• Role: Speaker, Volunteer, Organizer, Panelist, Moderator<br>• One Event can have many Contacts; one Contact can participate in many Events |

---

### BR-007: View Full Profile Action

| Attribute | Description |
|-----------|-------------|
| **ID** | BR-007 |
| **Title** | View Full Profile Button on Contact |
| **Description** | The system shall provide a "View Full Profile" action (button or Quick Action) on the Contact record that opens the complete profile view. |
| **Rationale** | Single-click access to consolidated profile from Contact. |
| **Priority** | Must Have |
| **Acceptance Criteria** | • Action visible on Contact record page<br>• Action opens Full Profile (Lightning page)<br>• Full Profile displays for the selected Contact |

---

### BR-008: Full Profile Page Content

| Attribute | Description |
|-----------|-------------|
| **ID** | BR-008 |
| **Title** | Full Profile Page Layout |
| **Description** | The Full Profile page shall display: Contact header (name, photo, headline), Summary, Experience related list, Skills (Contact Skills with proficiency), Projects, and Event participation. |
| **Rationale** | Consolidated view of all profile components. |
| **Priority** | Must Have |
| **Acceptance Criteria** | • Sections in order: Header, Summary, Experience, Skills, Projects, Events<br>• Use standard Lightning components where possible<br>• Related lists show correct Contact's data |

---

### BR-009: Use Standard Features

| Attribute | Description |
|-----------|-------------|
| **ID** | BR-009 |
| **Title** | Prefer Standard Salesforce Features |
| **Description** | The solution shall use standard Salesforce objects, components, and features wherever possible to minimize custom development and maintenance. |
| **Rationale** | Reduces technical debt and upgrade risk. |
| **Priority** | Should Have |
| **Acceptance Criteria** | • Contact (standard) as central record<br>• Standard Related List, Record Detail components<br>• Custom objects only where standard does not suffice |

---

### BR-010: Multi-Contact Readiness

| Attribute | Description |
|-----------|-------------|
| **ID** | BR-010 |
| **Title** | Support Multiple Contacts |
| **Description** | The data model and UI shall support multiple Contacts having full profiles without architectural changes. |
| **Rationale** | Future extensibility beyond initial single-profile use case. |
| **Priority** | Should Have |
| **Acceptance Criteria** | • All relationships filter by Contact<br>• No hard-coded Contact references<br>• Sharing model allows multi-user access |

---

## 3. Requirements Traceability

| BR ID | Linked Stories |
|-------|----------------|
| BR-001 | STORY-001 |
| BR-002 | STORY-002 |
| BR-003 | STORY-003 |
| BR-004 | STORY-004 |
| BR-005 | STORY-005 |
| BR-006 | STORY-006, STORY-007 |
| BR-007 | STORY-008 |
| BR-008 | STORY-008, STORY-009 |
| BR-009 | All |
| BR-010 | All |
