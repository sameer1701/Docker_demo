FROM maven:3.5.2-jdk-8-alpine AS MAVEN_BUILD
COPY . /usr/build/
WORKDIR /usr/build/
RUN mvn clean install

FROM openjdk:8-jre-alpine
WORKDIR /usr/app/
COPY --from=MAVEN_BUILD /build/taget/demo-docker-0.0.1-SNAPSHOT.jar /usr/app/
ENTRYPOINT ["java","-jar","demo-docker-0.0.1-SNAPSHOT.jar"]
