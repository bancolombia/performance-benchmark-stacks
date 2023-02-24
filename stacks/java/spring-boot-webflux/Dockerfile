FROM gradle:jdk11-alpine as builder
WORKDIR /app
COPY spring-boot-webflux spring-boot-webflux
COPY commons commons
RUN cd spring-boot-webflux && ./gradlew bootJar

FROM eclipse-temurin:11-alpine
EXPOSE 8080
COPY --from=builder /app/spring-boot-webflux/build/libs/*.jar app.jar
ENV JAVA_OPTS="-XX:+UseContainerSupport -Djava.security.egd=file:/dev/./urandom"
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -jar app.jar"]
