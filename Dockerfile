
FROM openjdk:18-alpine

COPY settings.xml /usr/share/maven/ref/
#COPY --from=maven /root/.m2 /root/.m2
#FROM maven:latest as maven
WORKDIR /app
#
#ADD pom.xml /app
#COPY . /app
#RUN mvn -B -f /app/pom.xml -s /usr/share/maven/ref/settings-docker.xml dependency:resolve
#RUN mvn dependency:go-offline -B
#RUN mvn clean verify package -U -DskipTests --fail-never
#

#RUN mvn clean install -DskipTests
COPY /target /app/target
EXPOSE 8080
ENTRYPOINT ["java","-jar","/app/target/timesheet-1.0.jar"]
# mvn clean verify sonar:sonar \-Dsonar.projectKey=timesheet \-Dsonar.host.url=http://sonarqube:9000 \-Dsonar.login=671889f8c03d37967fa443b240040f4ebd77b995