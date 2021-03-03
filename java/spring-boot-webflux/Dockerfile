FROM gradle:jdk11-openj9 as builder
WORKDIR /app
COPY . .
RUN gradle bootJar

FROM adoptopenjdk/openjdk11-openj9:x86_64-alpine-jre-11.0.10_9_openj9-0.24.0
EXPOSE 8080
COPY --from=builder /app/build/libs/*.jar app.jar
ENV JAVA_OPTS="-XX:+UseContainerSupport -Djava.security.egd=file:/dev/./urandom"
ENTRYPOINT ["sh","-c","java $JAVA_OPTS -jar app.jar"]
