#
# Build jar stage
#
FROM maven:3.9.0-eclipse-temurin-11 AS build
WORKDIR /home/app
COPY . .
#RUN mvn -f /home/app/pom.xml clean package
RUN mvn -f pom.xml clean package
#RUN ls -la
#RUN pwd
RUN sh ./jenkins/scripts/build.sh
#RUN ls -la target
ENTRYPOINT ["java","-jar","target/my-app-1.0-SNAPSHOT.jar"]
