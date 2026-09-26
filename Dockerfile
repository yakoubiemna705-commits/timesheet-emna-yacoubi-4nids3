FROM eclipse-temurin:8-jdk-alpine
EXPOSE 8082
ADD target/timesheet-devops-1.1.jar timesheet-devops-1.1.jar
ENTRYPOINT ["java","-jar","/timesheet-devops-1.1.jar"]
