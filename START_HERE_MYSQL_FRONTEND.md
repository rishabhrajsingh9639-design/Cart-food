# Simple Frontend + MySQL Setup (Windows / IntelliJ)

## What changed
- A simple HTML/CSS/JavaScript frontend is now included directly in `foodordering/src/main/resources/static/index.html`.
- It loads menu items, places orders, displays saved orders, and optionally shows loyalty points.
- No Node.js or React installation is required.
- MySQL profiles are available for BOTH food-ordering (8080) and loyalty (8081) services.
- Default H2 setup remains available for easy testing and the original automated tests.

## 1. Install and start MySQL
Install MySQL Server and MySQL Workbench if not already installed. Make sure MySQL is running on port 3306. Remember your MySQL administrator password.

## 2. Create databases
Open MySQL Workbench and run `docs/mysql-setup.sql`. **First change** `CHANGE_THIS_PASSWORD` to a password you choose. The script creates `foodordering` and `foodordering_loyalty`, and a limited application account named `foodapp`.

If MySQL says user already exists, run `ALTER USER 'foodapp'@'localhost' IDENTIFIED BY 'your-new-password';` yourself (replace the example password). Do not put passwords into your Java source files or commit them to Git.

## 3. Open the ZIP in IntelliJ
Extract the ZIP; open the root `FoodOrdering_Unit5` folder in IntelliJ as a Maven project. Select a JDK 17 or newer; wait for Maven to import. The two Maven modules are `foodordering` and `loyalty-service`.

## 4. Run foodordering with MySQL
Run > Edit Configurations > create an **Application** configuration for `com.example.foodordering.FoodOrderingApplication` (module `foodordering`).

Set **Active profiles** to `mysql,microservices` (or put `--spring.profiles.active=mysql,microservices` under Program arguments).

Set environment variables (IntelliJ Run Configuration > Environment variables):

`FOOD_DB_USER=foodapp;FOOD_DB_PASSWORD=YOUR_PASSWORD`

Optionally change URL using `FOOD_DB_URL` if MySQL is not at localhost:3306. Do not include placeholder literals like `YOUR_PASSWORD`; use the password you actually chose.

## 5. Run loyalty service with MySQL
Create another Application configuration for `com.example.loyalty.LoyaltyApplication` (module `loyalty-service`).

Set **Active profiles** to `mysql`.

Set environment variables:

`LOYALTY_DB_USER=foodapp;LOYALTY_DB_PASSWORD=YOUR_PASSWORD`

For another MySQL server override `LOYALTY_DB_URL`.

Start loyalty service first (port 8081), then foodordering (port 8080). The two services use separate MySQL schemas.

## 6. Check frontend and API
Open **http://localhost:8080/** in your browser. The frontend is served by Spring Boot itself (no separate frontend command).

- Check menu loads: `http://localhost:8080/api/menu`
- Enter customer name, choose food and quantity, click **Place Order**.
- Confirm successful message and new entry under **Previous Orders**.
- Confirm loyalty scores appear under **Loyalty Points**.
- Refresh the page and restart both services; confirm previous orders remain.

## 7. Confirm MySQL saved records
In MySQL Workbench run:

```sql
USE foodordering;
SHOW TABLES;
SELECT * FROM food_items;
SELECT * FROM food_orders ORDER BY id DESC;

USE foodordering_loyalty;
SHOW TABLES;
```

JPA creates tables on startup in the configured databases (`ddl-auto=update`). If a query fails, inspect `SHOW TABLES` to confirm the exact name.

## 8. Screenshots for final Unit 5 report
1. Project structure showing controller / service / repository / entity classes.
2. `application-mysql.properties` **without showing any real password**.
3. Spring Boot consoles proving startup on ports 8080 and 8081.
4. MySQL Workbench `SHOW TABLES` and populated food-items/orders tables.
5. Simple frontend showing menu and order form.
6. Successful order confirmation and saved orders after refresh.
7. Loyalty points (when both services run).
8. Tests run in IntelliJ (green pass status); run tests separately using the `test` profile / default setup.

## Troubleshooting
- **Access denied for user**: fix MySQL username/password and grants; check Run Configuration environment variables.
- **Communications link failure**: start MySQL; verify port 3306 and firewall.
- **Table doesn't exist**: check active `mysql` profile and whether JPA startup completed; run `SHOW TABLES`.
- **Port already in use**: stop an existing Java run configuration using that port.
- **Loyalty service not enabled**: use `mysql,microservices` for foodordering and `mysql` for loyalty-service.
- **Missing Maven dependencies**: reload Maven projects in IntelliJ when online.

## Verification note
The MySQL setup has been configured in code. A live MySQL server and database credentials are not provided here, so a real MySQL connection has NOT been verified. Run the above checks locally to finish integration.
