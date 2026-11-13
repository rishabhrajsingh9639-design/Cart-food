# Food Ordering System — Units 4 and 5

This project extends your existing Unit 4 Food Ordering Spring Boot project with a real data layer and a separate loyalty microservice. It retains the existing `GET /api/menu`, `POST /api/orders` and `GET /api/orders/{id}` endpoints and their original response fields.

## Requirements

- JDK 17 or later; Java 17 was used for verification.
- IntelliJ IDEA, or a terminal. Maven 3.9.9 is downloaded by the included Maven Wrapper; a separate Maven installation is unnecessary.
- Internet access for the first Maven dependency download.
- Free local ports 8080 (ordering) and 8081 (loyalty).
- No database installation for the default H2 setup. MySQL is optional.

Spring Boot remains **3.5.7**, matching the supplied project. Both services use Spring Data JPA/Hibernate and their own H2 database.

## Fastest way on Windows

1. Extract the entire ZIP to a normal folder, such as `C:/Projects/FoodOrdering_Unit5`. Do not run files from inside the ZIP.
2. Check `java -version` in a terminal. Use JDK 17 or later and set `JAVA_HOME` if the Maven Wrapper cannot find Java.
3. Double-click `RUN_WINDOWS.bat`. It builds, runs the tests and launches two service windows.
4. Wait for `Started LoyaltyApplication` and `Started FoodOrderingApplication`.
5. Open **http://localhost:8080**. Place an order, refresh history, and check the leaderboard.
6. Stop each service with Ctrl+C in its window. Run the same script from the same folder to restart; default data survives.

On macOS/Linux: `chmod +x mvnw RUN_MAC_LINUX.sh`, then `./RUN_MAC_LINUX.sh`.

## Run from IntelliJ

1. Open the **root `pom.xml`**, above both module folders, as a Maven project.
2. Set Project SDK and Maven importer/runner JDK to Java 17, then Reload All Maven Projects.
3. Run `com.example.loyalty.LoyaltyApplication` from the `loyalty-service` module.
4. Run `com.example.foodordering.FoodOrderingApplication` from `foodordering`. In its run configuration add program argument **`--spring.profiles.active=microservices`**.
5. Set both run configurations' working directory to the extracted project root. This keeps the database location consistent with the scripts.
6. Open http://localhost:8080.

If IntelliJ has no Spring profile field, the program argument above works with an ordinary Java Application run configuration. Do not start the batch script and IntelliJ servers at the same time on the same ports.

## Build and run manually

From the root folder, on Windows:

```bat
mvnw.cmd clean package
```

Then use two terminals in that same root folder:

```bat
java -jar loyalty-service/target/loyalty-service-2.0.0.jar
```

```bat
java -jar foodordering/target/foodordering-2.0.0.jar --spring.profiles.active=microservices
```

Use `./mvnw` instead of `mvnw.cmd` on macOS/Linux. This source ZIP deliberately excludes build output; `package` produces the two runnable JARs.

For Unit 5 data-layer work alone, run `FoodOrderingApplication` without a profile. Ordering still works; the loyalty panel explains that loyalty is disabled. Enabling the microservices profile later delivers any orders still awaiting points.

## What's included

| Area | Implementation |
|---|---|
| Persistent data | FoodItem, Customer and FoodOrder entities; generated IDs and relationships |
| Database access | Three JpaRepository interfaces, derived searches, transactions |
| CRUD | Create/read/update/delete menu items; create/read/filter order history |
| Database configuration | Persistent H2 by default; optional in-memory demo and MySQL profiles |
| Microservices | Independent ordering and loyalty applications, ports and databases |
| Loyalty | ScoreCard, BadgeCard, BadgeType; 10 points/order; badges at 1/3/5/10 orders |
| Communication | JSON over HTTP through a LoyaltyGateway interface; retry pending rewards |
| Duplicate protection | UUID order reference and database uniqueness prevent duplicate points |
| UI | Original demo page extended with order history and a polling leaderboard |
| Verification | JUnit/Spring Boot database and HTTP tests, plus recorded live-service checks |

## Open these next

- [Unit 5 guide, architecture and domain classes](docs/UNIT5_GUIDE.md)
- [Screenshot checklist](docs/SCREENSHOTS_TO_ATTACH.md)
- [API requests for IntelliJ/Postman](requests.http)
- [Database queries](docs/database-queries.sql)
- [Actual verification results](docs/evidence/VERIFICATION.md)
- [Frontend integration notes](docs/FRONTEND_INTEGRATION.md)

The material in `docs/unit4-reference/` is the original, historical Unit 4 submission; its in-memory statements and old test counts describe that earlier version.

## Scope

This is a local classroom application with demo customer aliases. The Unit 5 data-layer and microservice examples are adapted to food orders. Authentication, stored passwords, login lockout, payment processing, multi-item carts and public deployment are not implemented. Theory-only topics from the slides are identified in the guide rather than presented as completed features. The menu modification endpoints are for local demonstration.


## Simple frontend with MySQL
See [START_HERE_MYSQL_FRONTEND.md](START_HERE_MYSQL_FRONTEND.md) for the recommended IntelliJ and MySQL setup.
