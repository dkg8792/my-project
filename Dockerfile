FROM eclipse-temurin:17-jdk-jammy as builder
WORKDIR /build
COPY . .
RUN ./gradlew build -x test

FROM eclipse-temurin:17-jre-jammy
EXPOSE 8080
WORKDIR /usr/app
COPY --from=builder /build/build/libs/*.jar app.jar
ENTRYPOINT ["java", "-jar", "app.jar"]
