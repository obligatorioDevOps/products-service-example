FROM maven:3.6.3-openjdk-8-slim AS build
RUN mvn -B package --file pom.xml -DskipTests


FROM openjdk:8-jdk-alpine
COPY --from=build ./target/orders-service-example-0.0.1-SNAPSHOT.jar app.jar
EXPOSE 8080
CMD java -jar /app.jar 

