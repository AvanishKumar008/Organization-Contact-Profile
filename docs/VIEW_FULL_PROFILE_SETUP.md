# View Profile on Contact

## Option A: Contact Profile Page (Recommended)

A **Contact Profile** Lightning record page is deployed. To view a Contact's profile:

1. Open any Contact record
2. Use the **page dropdown** (top of record, next to the tab bar) 
3. Select **Contact Profile**

The profile (timeline, skills, events) will display.

If "Contact Profile" does not appear in the dropdown: Setup → Object Manager → Contact → Lightning Record Pages → ensure **Contact Profile** is assigned to your app.

## Option B: View Full Profile Button (Manual Setup)

The **View Full Profile** Quick Action must be added to the Contact record page to appear.

### Manual Setup (App Builder)

1. Go to **Setup** → **Object Manager** → **Contact**
2. Click **Lightning Record Pages**
3. Open the **default** Contact record page (e.g. "Contact Record Page")
4. Click **Edit**
5. In the **Highlights Panel** (top section), click the **Setup** (gear) icon
6. Under **Salesforce Mobile and Lightning Experience Actions**, click **Add**
7. Find and select **View Full Profile**
8. Drag it to the desired position (e.g. first in the list)
9. Click **Save** → **Save**

## Alternative: Page Layout

1. Go to **Setup** → **Object Manager** → **Contact** → **Page Layouts**
2. Edit the **Contact Layout** (or the layout assigned to your Contact page)
3. Scroll to **Salesforce Mobile and Lightning Experience Actions**
4. Click **Add** (wrench icon) and add **View Full Profile**
5. Save the layout

## Verifying

- **Option A:** Page dropdown shows "Contact Profile" – select it to view the profile
- **Option B:** View Full Profile button appears in the action bar (top right, near Edit/Delete)

---

## Troubleshooting

If the action still doesn't appear:
- Ensure the **View Full Profile** Quick Action is deployed (Setup → Object Manager → Contact → Buttons, Links, and Actions)
- The Lightning record page may need to be the one assigned to your app and profile
