FROM maven:3.9.11-eclipse-temurin-11-alpine
WORKDIR /app
COPY pom.xml .
RUN mvn dependency:go-offline
COPY src ./src
RUN mvn clean package -DskipTests
CMD ["java", "-cp", "target/calculator-1.0-SNAPSHOT-jar-with-dependencies.jar", "com.App", "add(5,5)"]
