FROM openjdk:8-jdk-alpine
COPY products-service-example.jar app.jar
CMD java -jar /app.jar $APP_ARGS

 