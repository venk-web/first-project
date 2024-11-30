# Use OpenJDK 17 base image
FROM openjdk:17-jdk-slim

# Add application JAR to the image
COPY target/hello-world-1.0-SNAPSHOT.jar /app/hello-world.jar

# Command to run the application
ENTRYPOINT ["java", "-jar", "/app/hello-world.jar"]

