# Restaurant frontend – run in IntelliJ

1. **Stop** FoodOrderingApplication (red square). LoyaltyApplication can stay running.
2. Open this updated ZIP as a **new extracted folder**. Do not run the previous project directory.
3. In IntelliJ reload Maven if prompted. Use `microservices` as the active profile for FoodOrderingApplication.
4. Start LoyaltyApplication (port 8081) and FoodOrderingApplication (port 8080).
5. Open `http://localhost:8080/` and do a hard refresh (`Ctrl+Shift+R`).
6. Browse the demo restaurant cards, select a restaurant, add its dishes to cart, enter a customer name and place the order.
7. Verify Previous Orders and Loyalty Points. Data is saved via the existing POST `/api/orders` endpoint.

## Scope and limitations
The three restaurants are demo names for a class project, not real businesses. `restaurantName` is now stored on FoodItem and returned by GET `/api/menu` for newly seeded items. Existing saved menu rows with no restaurant name will appear under Campus Kitchen. The existing order schema is one food item per order; checkout therefore sends one order request for each cart line (and shows partial success if a request fails). This is **not** a combined, multi-item transaction, and there is no payment integration. Nutritional estimates remain frontend presentation data and should not be treated as medically verified. Most Ordered is derived from existing order history. MySQL can be activated later via the existing `mysql,microservices` profiles and MySQL setup guide.
