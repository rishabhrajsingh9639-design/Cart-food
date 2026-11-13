# CraveCart conservative food photo audit

This edition avoids mismatched stock imagery and all emoji image overlays.

- 24 menu entries were checked against the existing JavaScript photo mapping (plus Garlic Bread, which had no mapped photo).
- **Retained:** Masala Dosa, Idli Sambar, Grilled Chicken Sandwich. These appear visually consistent with the user-provided screenshots, but **their source/authenticity cannot be independently guaranteed**.
- **Hidden:** All other remote food photographs (including the mismatched Paneer Kathi Roll stock photograph). Their dish names appear in a neutral, text-only panel until a genuinely verified photograph is supplied.
- Restaurant cards similarly show a photo only for South Spice and Sandwich Studio.
- Full list is in `FOOD_IMAGE_AUDIT.csv`. No new AI-generated icons or food photos were added.
- Menu, order processing, reviews, nutrition, database configuration, and Java service files were not altered.

To add accurate images, obtain actual food photographs you own or properly licensed dish-specific photos and verify each against the menu entry. Add them to the frontend after that review.

**Run:** Extract ZIP, open `FoodOrdering_Unit5/pom.xml` in IntelliJ, reload Maven, start the backend, then refresh the browser with Ctrl+Shift+R.
