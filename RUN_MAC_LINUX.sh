#!/usr/bin/env sh
set -eu
cd "$(dirname "$0")"
./mvnw clean package
java -jar loyalty-service/target/loyalty-service-2.0.0.jar &
loyalty_pid=$!
trap 'kill "$loyalty_pid" 2>/dev/null || true' EXIT INT TERM
echo "After startup, open http://localhost:8080. Press Ctrl+C to stop."
java -jar foodordering/target/foodordering-2.0.0.jar --spring.profiles.active=microservices
