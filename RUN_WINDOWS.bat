@echo off
setlocal
cd /d "%~dp0"
echo Building and testing both services...
call mvnw.cmd clean package
if errorlevel 1 goto failed
start "Loyalty service - 8081" cmd /k java -jar loyalty-service/target/loyalty-service-2.0.0.jar
start "Food ordering - 8080" cmd /k java -jar foodordering/target/foodordering-2.0.0.jar --spring.profiles.active=microservices
echo Wait for both Started messages, then open http://localhost:8080
echo Close each service window or press Ctrl+C there to stop it.
pause
exit /b 0
:failed
echo Build failed. Check the message above and ensure Java 17 or later is installed.
pause
exit /b 1
