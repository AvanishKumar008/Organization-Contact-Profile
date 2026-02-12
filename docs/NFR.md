# Non-Functional Requirements (NFR)

**Document Version:** 1.0  
**Project:** Organization-Contact-Profile  
**Last Updated:** February 2025

---

## 1. Overview

This document captures the Non-Functional Requirements that define how the solution shall behave in terms of performance, security, deployment, and operations.

---

## 2. Non-Functional Requirements

### NFR-001: Deployment via Metadata API

| Attribute | Description |
|-----------|-------------|
| **ID** | NFR-001 |
| **Category** | Deployability |
| **Title** | Salesforce Metadata API / SFDX Deployment |
| **Description** | The solution shall be deployable using the Salesforce Metadata API and Salesforce CLI (sf/sfdx). All components shall be source-controlled in SFDX format. |
| **Priority** | Must Have |
| **Acceptance Criteria** | • All metadata in force-app/main/default/<br>• `sf project deploy start` succeeds<br>• No manual setup required beyond org authentication |

---

### NFR-002: Configuration-Only (No Custom Code)

| Attribute | Description |
|-----------|-------------|
| **ID** | NFR-002 |
| **Category** | Maintainability |
| **Title** | Configuration-Only Core Functionality |
| **Description** | Core functionality shall be achieved through declarative configuration (custom objects, fields, page layouts, Lightning pages). No Apex, Visualforce, or LWC required for basic operation. |
| **Priority** | Should Have |
| **Acceptance Criteria** | • Profile, Experience, Skills, Projects, Events work without custom code<br>• Custom code only for optional enhancements |

---

### NFR-003: Lightning Experience Compatibility

| Attribute | Description |
|-----------|-------------|
| **ID** | NFR-003 |
| **Category** | Compatibility |
| **Title** | Lightning Experience Support |
| **Description** | The solution shall be fully compatible with Lightning Experience. All pages and components shall render correctly in Lightning. |
| **Priority** | Must Have |
| **Acceptance Criteria** | • Full Profile page works in Lightning<br>• Related lists display correctly<br>• No Classic-only dependencies |

---

### NFR-004: Multi-Contact Scalability

| Attribute | Description |
|-----------|-------------|
| **ID** | NFR-004 |
| **Category** | Scalability |
| **Title** | Multi-Contact Data Model |
| **Description** | The data model shall support multiple Contacts with full profiles without schema changes or performance degradation. |
| **Priority** | Should Have |
| **Acceptance Criteria** | • Lookup relationships support N records per Contact<br>• Queries and list views performant for 100+ contacts |

---

### NFR-005: Version Control and CI/CD

| Attribute | Description |
|-----------|-------------|
| **ID** | NFR-005 |
| **Category** | DevOps |
| **Title** | Version Control and CI/CD |
| **Description** | All changes shall be managed via version control (Git). Pull requests shall trigger validation before merge. Deployment shall be automated via CI/CD. |
| **Priority** | Must Have |
| **Acceptance Criteria** | • Code in GitHub repository<br>• PR triggers scratch org deployment and validation<br>• Merge to main deploys to Developer org<br>• Validation must pass before merge |

---

### NFR-006: DevHub and Scratch Org

| Attribute | Description |
|-----------|-------------|
| **ID** | NFR-006 |
| **Category** | Infrastructure |
| **Title** | DevHub and Scratch Org for Validation |
| **Description** | The project shall use a Developer org enabled as DevHub. PR validation shall create ephemeral scratch orgs for deployment validation. |
| **Priority** | Must Have |
| **Acceptance Criteria** | • DevHub org available for scratch org creation<br>• Scratch org created from config/project-scratch-def.json<br>• Validation runs in scratch org, not production |

---

### NFR-007: PR-Based Development

| Attribute | Description |
|-----------|-------------|
| **ID** | NFR-007 |
| **Category** | Process |
| **Title** | Pull Request per Story |
| **Description** | Implementation shall follow a PR-per-story workflow. Each story shall be developed in a feature branch and submitted as a PR. |
| **Priority** | Must Have |
| **Acceptance Criteria** | • One PR per story<br>• PR references story/task ID<br>• PR must pass validation before merge |

---

### NFR-008: Branch Protection

| Attribute | Description |
|-----------|-------------|
| **ID** | NFR-008 |
| **Category** | Security / Process |
| **Title** | Branch Protection on main |
| **Description** | The main branch shall be protected. Direct pushes to main shall be restricted. Merges shall require PR approval and passing validation. |
| **Priority** | Must Have |
| **Acceptance Criteria** | • No direct push to main<br>• PR required for merge<br>• CI validation status check required |

---

### NFR-009: API Version Consistency

| Attribute | Description |
|-----------|-------------|
| **ID** | NFR-009 |
| **Category** | Compatibility |
| **Title** | Consistent API Version |
| **Description** | All metadata shall use a consistent Salesforce API version as defined in sfdx-project.json. |
| **Priority** | Must Have |
| **Acceptance Criteria** | • sourceApiVersion in sfdx-project.json<br>• All metadata compatible with specified version |

---

### NFR-010: Documentation

| Attribute | Description |
|-----------|-------------|
| **ID** | NFR-010 |
| **Category** | Maintainability |
| **Title** | In-Repo Documentation |
| **Description** | BR, NFR, Solution Document, Project Plan, and CI/CD instructions shall be maintained in the repository under docs/. |
| **Priority** | Should Have |
| **Acceptance Criteria** | • docs/BR.md, docs/NFR.md, docs/SOLUTION_DOCUMENT.md<br>• docs/PROJECT_PLAN.md<br>• README with setup and deployment instructions |

---

## 3. NFR Summary by Category

| Category | NFR IDs |
|----------|---------|
| Deployability | NFR-001 |
| Maintainability | NFR-002, NFR-010 |
| Compatibility | NFR-003, NFR-009 |
| Scalability | NFR-004 |
| DevOps | NFR-005 |
| Infrastructure | NFR-006 |
| Process | NFR-007, NFR-008 |
