FROM eclipse-temurin:21-jre-alpine
WORKDIR /app

# Cài đặt curl để Docker Healthcheck hoạt động
RUN apk add --no-cache curl

# Copy file jar đã build sẵn từ máy thật vào container
COPY target/*.jar app.jar

ENTRYPOINT ["java", "-jar", "app.jar"]
