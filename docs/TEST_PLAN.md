# Test Plan

**Document Version:** 1.0  
**Project:** Organization-Contact-Profile  
**Last Updated:** February 2025

---

## 1. Overview

This Test Plan defines the testing approach for the Organization-Contact-Profile Salesforce solution. It covers validation of custom objects, fields, relationships, and user flows per Business Requirements (BR) and Stories.

---

## 2. Test Scope

| In Scope | Out of Scope |
|----------|--------------|
| Profile__c, Experience__c, Skill__c, Contact_Skill__c, Project__c | Event__c, Event_Participant__c (not yet implemented) |
| Contact custom fields (Summary, Headline) | Full Profile Lightning page (not yet implemented) |
| Lookup relationships and delete constraints | View Full Profile action |
| Page layouts and related lists | Performance/load testing |
| Deployment validation (CI/CD) | Security penetration testing |

---

## 3. Test Types

| Type | Description |
|------|-------------|
| **Smoke** | Quick verification that core components deploy and are accessible |
| **Functional** | Verification against BR acceptance criteria |
| **Integration** | End-to-end flows across objects |
| **Regression** | Re-verification after changes |

---

## 4. Test Environment

- **Org:** SelfProfile (avanish.kumar@profile.package)
- **Edition:** Developer
- **Lightning Experience:** Enabled

---

## 5. Test Cases

### 5.1 Profile__c Object (BR-001)

| TC-ID | Test Case | Steps | Expected Result | BR |
|-------|------------|-------|-----------------|-----|
| TC-001-01 | Profile record creation | 1. Navigate to Profile tab<br>2. Click New<br>3. Select Contact<br>4. Enter Headline and Summary<br>5. Save | Profile record created successfully | BR-001 |
| TC-001-02 | Profile required Contact | 1. Create Profile without Contact<br>2. Save | Validation error: Contact is required | BR-001 |
| TC-001-03 | Profile Headline length | 1. Enter 255+ characters in Headline<br>2. Save | Validation error or truncation per field definition | BR-001 |

### 5.2 Experience__c Object (BR-002)

| TC-ID | Test Case | Steps | Expected Result | BR |
|-------|------------|-------|-----------------|-----|
| TC-002-01 | Experience record creation | 1. Create Experience with Contact, Title, Company<br>2. Save | Experience created | BR-002 |
| TC-002-02 | Experience required fields | 1. Create Experience without Title or Company<br>2. Save | Validation error | BR-002 |
| TC-002-03 | Experience related to Contact | 1. Open Contact<br>2. View Experiences related list | Experience records for that Contact displayed | BR-002 |
| TC-002-04 | Contact delete with Experience | 1. Create Contact with Experience<br>2. Try to delete Contact | Delete blocked (Restrict) | BR-002 |

### 5.3 Skill__c Object (BR-003)

| TC-ID | Test Case | Steps | Expected Result | BR |
|-------|------------|-------|-----------------|-----|
| TC-003-01 | Skill record creation | 1. Create Skill with Name, Category<br>2. Save | Skill created | BR-003 |
| TC-003-02 | Skill Category picklist | 1. Create Skill<br>2. Select Category | Options: Technical, Soft, Domain, Other | BR-003 |
| TC-003-03 | Skill shared usage | 1. Create Skill "JavaScript"<br>2. Create Contact_Skill for Contact A<br>3. Create Contact_Skill for Contact B<br>4. Both reference same Skill | Same Skill used by multiple Contacts | BR-003 |

### 5.4 Contact_Skill__c Object (BR-004)

| TC-ID | Test Case | Steps | Expected Result | BR |
|-------|------------|-------|-----------------|-----|
| TC-004-01 | Contact_Skill creation | 1. Create Contact_Skill with Contact, Skill, Proficiency<br>2. Save | Contact_Skill created | BR-004 |
| TC-004-02 | Proficiency picklist | 1. Create Contact_Skill<br>2. Select Proficiency | Options: Beginner, Intermediate, Advanced, Expert | BR-004 |
| TC-004-03 | Contact_Skill on Contact | 1. Open Contact<br>2. View Contact Skills related list | Contact_Skill records with Skill and Proficiency | BR-004 |
| TC-004-04 | Contact delete with Contact_Skills | 1. Create Contact with Contact_Skills<br>2. Try to delete Contact | Delete blocked | BR-004 |
| TC-004-05 | Skill delete with Contact_Skills | 1. Create Skill with Contact_Skills<br>2. Try to delete Skill | Delete blocked | BR-004 |

### 5.5 Project__c Object (BR-005)

| TC-ID | Test Case | Steps | Expected Result | BR |
|-------|------------|-------|-----------------|-----|
| TC-005-01 | Project record creation | 1. Create Project with Contact, Name, Type<br>2. Save | Project created | BR-005 |
| TC-005-02 | Project Type picklist | 1. Create Project<br>2. Select Type | Options: Public, Private | BR-005 |
| TC-005-03 | Project optional fields | 1. Create Project with URL, Description, dates<br>2. Save | All fields saved | BR-005 |
| TC-005-04 | Project related to Contact | 1. Open Contact<br>2. View Projects related list | Projects for Contact displayed with Type | BR-005 |
| TC-005-05 | Contact delete with Projects | 1. Create Contact with Projects<br>2. Try to delete Contact | Delete blocked | BR-005 |

### 5.6 Deployment & CI/CD (NFR-005)

| TC-ID | Test Case | Steps | Expected Result | NFR |
|-------|------------|-------|-----------------|-----|
| TC-NFR-01 | Deploy via CLI | 1. Run sf project deploy start | Deployment succeeds | NFR-001 |
| TC-NFR-02 | PR validation | 1. Create PR to main<br>2. Trigger CI | Scratch org deploy succeeds | NFR-005 |
| TC-NFR-03 | Merge deploy | 1. Merge PR to main | Deploy to Developer org succeeds | NFR-005 |

---

## 6. Test Data Requirements

| Data | Purpose |
|------|---------|
| Contact | At least 2 Contacts for multi-contact tests |
| Profile | 1 Profile per Contact |
| Experience | 2+ Experiences per Contact |
| Skill | 3+ Skills (different categories) |
| Contact_Skill | 2+ per Contact |
| Project | 2+ per Contact (1 Public, 1 Private) |

---

## 7. Pass/Fail Criteria

| Criterion | Definition |
|-----------|------------|
| **Pass** | All test steps complete; expected results match |
| **Fail** | Any step fails; expected result not achieved |
| **Blocked** | Test cannot run due to dependency or defect |

---

## 8. Test Execution Checklist

- [ ] TC-001-01, TC-001-02, TC-001-03
- [ ] TC-002-01, TC-002-02, TC-002-03, TC-002-04
- [ ] TC-003-01, TC-003-02, TC-003-03
- [ ] TC-004-01, TC-004-02, TC-004-03, TC-004-04, TC-004-05
- [ ] TC-005-01, TC-005-02, TC-005-03, TC-005-04, TC-005-05
- [ ] TC-NFR-01, TC-NFR-02, TC-NFR-03

---

## 9. Document History

| Version | Date | Author | Changes |
|---------|------|--------|---------|
| 1.0 | Feb 2025 | Avanish Kumar | Initial Test Plan |
