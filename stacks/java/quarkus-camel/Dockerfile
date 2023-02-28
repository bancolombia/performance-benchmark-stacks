FROM maven:3.8.4-eclipse-temurin-17 as builder
WORKDIR /app
COPY quarkus-camel quarkus-camel
WORKDIR /app/quarkus-camel
RUN mvn clean package

FROM eclipse-temurin:17-alpine
EXPOSE 8080
COPY --from=builder /app/quarkus-camel/target/quarkus-app quarkus-app
ENV JAVA_OPTS="-XX:+UseContainerSupport -Djava.security.egd=file:/dev/./urandom"
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -jar quarkus-app/quarkus-run.jar"]
