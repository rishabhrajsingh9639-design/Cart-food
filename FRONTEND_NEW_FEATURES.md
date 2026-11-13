# CraveCart frontend update

- Home/Menu: restaurant & food search, 10 restaurant cards, food photos with emoji fallback, nutrition estimates, restaurant estimate 25–40 minutes.
- About: features, architecture overview, service limitations.
- Help/Contact: FAQs and an on-page message preparation form (no real messaging service).
- Orders: saved JPA-backed star reviews on your own previous orders and an average food rating.
- Checkout and login: shorter copy; sign-in is **not secure authentication** and card/UPI are **test selections**, not real payment processing.
- H2 remains active by default. MySQL configuration is unchanged. Hibernate creates the `food_reviews` table when schema updates are enabled.
- Restaurant and food images load from Unsplash over the internet; otherwise the emojis provide a visual fallback.
- ETA is an illustrative fixed range rather than a live courier tracking API.
- To run: Run LoyaltyApplication on 8081, FoodOrderingApplication on 8080 with profile `microservices`, open http://localhost:8080/login.html.
