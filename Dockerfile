FROM maven:3.6.3-openjdk-8-slim AS build
RUN mkdir -p /workspace
WORKDIR /workspace
COPY pom.xml /workspace
COPY src /workspace/src
RUN mvn -B package --file pom.xml -DskipTests

FROM openjdk:8-slim
COPY --from=build /workspace/target/products-service-example-0.0.1-SNAPSHOT-spring-boot.jar /app.jar
EXPOSE 8080
ENTRYPOINT ["java","-jar","app.jar"]
