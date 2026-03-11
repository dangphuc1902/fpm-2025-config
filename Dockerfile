# Use an official OpenJDK runtime as a parent image
FROM eclipse-temurin:17-jdk-jammy

# Set the working directory in the container
WORKDIR /app

# Copy the Maven wrapper and pom.xml to leverage Docker cache
COPY mvnw .
COPY .mvn .mvn
COPY pom.xml .

# Copy the project source
COPY src ./src

# Package the application
RUN ./mvnw package -DskipTests

# Make port 8888 available to the world outside this container
EXPOSE 8888

# Run the JAR file
ENTRYPOINT ["java", "-jar", "target/config-0.0.1-SNAPSHOT.jar"]
