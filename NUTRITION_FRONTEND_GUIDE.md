# Food Ordering – nutrition menu frontend

## What changed
- Food cards show food icons, prices and serving sizes.
- Hover over a food card, or tap/click **Nutrition & serving**, to reveal calories, protein, carbohydrates, and fat.
- **Most Ordered** is highlighted based on the highest number of orders fetched from `GET /api/orders`. No label appears until orders exist. Ties are both marked.
- The Budget Meal Finder, Reorder, Loyalty Points and order form are retained.
- No Java classes, repositories, endpoints, or database settings were modified.

## Important limitation
The nutrition figures in `foodordering/src/main/resources/static/index.html` are illustrative approximations for common portions, not verified information for this specific restaurant. They should not be used as precise dietary or medical guidance. Menu items without an estimate show 'Nutrition information is not available'. Serving information for example items is also approximate. When real nutrition data becomes available, replace the `nutritionExamples` values or store validated values in the database later.

## Run now without MySQL
You can continue to use the existing H2 default configuration. Open the `FoodOrdering_Unit5` project in IntelliJ and run `FoodOrderingApplication` (the service under `foodordering`). Open http://localhost:8080 . If you're using the loyalty service, run `LoyaltyApplication` as well with the existing profile configuration.

## Later: MySQL
The existing MySQL properties and the file `docs/mysql-setup.sql` have been preserved. When ready, follow `START_HERE_MYSQL_FRONTEND.md`. MySQL has not been tested by this frontend-only change.

## Screenshots for report
1. Menu cards with food icons and Most Ordered badge (after a few orders).
2. Hovered/expanded nutrition panel showing calories/protein/carbs/fat and serving information.
3. Order form and placed order, then Previous Orders and Reorder button.
4. Budget Meal Finder and its results.
5. Later, MySQL tables in Workbench.
