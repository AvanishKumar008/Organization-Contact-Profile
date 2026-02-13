# View Full Profile Button Setup

The **View Full Profile** Quick Action must be added to the Contact record page to appear in Lightning Experience.

## Manual Setup (App Builder)

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

Open any Contact record. The **View Full Profile** button should appear in the action bar (top right, near Edit/Delete).

---

## Troubleshooting

If the action still doesn't appear:
- Ensure the **View Full Profile** Quick Action is deployed (Setup → Object Manager → Contact → Buttons, Links, and Actions)
- The Lightning record page may need to be the one assigned to your app and profile
