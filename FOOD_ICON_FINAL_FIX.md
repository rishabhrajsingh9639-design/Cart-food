# CraveCart: Final Food-Card Icon Fix

- Removed the obsolete circular photo-icon CSS.
- Added explicit protection against older emoji-badge overlays.
- Food cards use a photograph only for the three screenshot-matched dish URLs.
- All other menu items use flat, text-only dish-name placeholders, not emoji artwork.
- Restaurant cards follow the same rule.
- Removed unused restaurant category emoji constants.
- Added asset version parameters to every page to prevent a browser from reusing the old JS/CSS.
- Spring Boot, ordering, nutrition, reviews, and database files are not modified.

## IMPORTANT for IntelliJ
1. Extract this ZIP into a NEW folder. Do not run the older ZIP.
2. Open the new FoodOrdering_Unit5 folder in IntelliJ IDEA.
3. Stop the old running Spring Boot app, then restart the app from the NEW extracted folder.
4. Open http://localhost:8080/index.html and press Ctrl+Shift+R.
5. If you still see an emoji floating over Egg Biryani, the browser is reaching the old app, or the old project is still running on port 8080. Stop it first.

Note: This does not certify the provenance of any stock photograph. No artificial food badges are present in current menu markup.
