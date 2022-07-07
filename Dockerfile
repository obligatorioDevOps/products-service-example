FROM openjdk:8-jdk-alpine
ARG JAR_FILE
COPY /workspace/target/products-service-example-0.0.1-SNAPSHOT-spring-boot.jar app.jar
CMD java -jar /app.jar $APP_ARGS

