# Final UI updates
- Individual photographs assigned to each of the 24 seeded dishes; restaurant images remain separate. Online images require internet access.
- Five sample ratings are clearly labeled as sample data. Real post-order reviews continue to be written to the existing JPA review repository.
- Help page: order-ID issue submission using POST /api/order-issues. Validates that the order exists, then persists issue in the configured database.
- About page describes CraveCart as a food-ordering service rather than a college project. Removes requested explanatory disclaimers.
- Checkout removes long payment-disclaimer paragraph. UPI and card options remain marked test options because no real payment provider is integrated.
- To run: start loyalty-service on port 8081 and foodordering on port 8080 with microservices profile. Refresh browser with Ctrl+Shift+R.
