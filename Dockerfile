FROM maven:3.6.3-openjdk-8-slim AS build
RUN mkdir -p /workspace
WORKDIR /workspace
COPY pom.xml /workspace
COPY src /workspace/src
RUN mvn -B package --file pom.xml -DskipTests


FROM openjdk:8-jdk-alpine
COPY --from=build /workspace/target/*jar-with-dependencies.jar app.jar
EXPOSE 8080
CMD java -jar /app.jar 

