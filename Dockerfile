FROM java:17
COPY ./target/service-discovery-0.0.1-SNAPSHOT.jar  service-discovery-0.0.1-SNAPSHOT.jar

ENTRYPOINT ["java", "-jar", "service-discovery-0.0.1-SNAPSHOT.jar"]
