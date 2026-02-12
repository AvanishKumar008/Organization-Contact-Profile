# Organization-Contact-Profile

Salesforce professional profile project with Experience, Skills, Projects and Events

## Documentation

- **[Project Plan](docs/PROJECT_PLAN.md)** – Overall detailed implementation plan with phases, timeline, and deliverables
- **[Solution Document](docs/SOLUTION_DOCUMENT.md)** – Technical solution design, requirements, data model, and architecture
- **[Business Requirements (BR)](docs/BR.md)** – Business requirements
- **[Non-Functional Requirements (NFR)](docs/NFR.md)** – Non-functional requirements
- **[Stories and Tasks](docs/STORIES.md)** – Implementation stories and tasks
- **[CI/CD Setup](docs/CI-CD.md)** – GitHub Actions setup and branch protection

## Quick Overview

| Component | Description |
|-----------|-------------|
| **Contact** | Central record with Summary and Headline custom fields |
| **Experience** | Work history (title, company, dates) |
| **Skill** | Shared master list; Contact_Skill links contacts with proficiency |
| **Project** | Public/Private projects per contact |
| **Event** | Events; Event_Participant links contacts as speaker, volunteer, organizer, etc. |
| **Full Profile** | Lightning record page opened via "View Full Profile" button |

## Deployment

```bash
# Deploy to default org
sf project deploy start

# Create scratch org
sf org create scratch -f config/project-scratch-def.json -a SelfProfile
```

## Project Structure

```
force-app/main/default/
├── objects/           # Custom objects and fields
├── flexipages/       # Lightning pages (to be added)
├── layouts/          # Page layouts (to be added)
└── quickActions/     # Quick actions (to be added)
```
