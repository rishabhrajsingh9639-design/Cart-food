# Two additional frontend features

1. **Budget Meal Finder**: enter a maximum spending amount, view currently available items within budget, and select one to fill the order form. Uses the real `GET /api/menu` response.
2. **Reorder from Previous Orders**: each existing order displays a Reorder button, which prefills the customer, food item, and quantity. The user explicitly confirms by clicking Place Order. Reordering unavailable items is disabled.

The order table also displays the existing backend `status` value. These additions use the existing REST APIs and do not need schema changes or new dependencies.

To run: follow `START_HERE_MYSQL_FRONTEND.md`. Open http://localhost:8080, try budget 150, order an item, then use the Reorder button in Previous Orders.
