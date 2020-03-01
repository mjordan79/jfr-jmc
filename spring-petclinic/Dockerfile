###i
# Containerize the Spring Petclinic application.
# Copyright(C) 2020 Objectway SpA - DevOps Team -
# The build container needs a fully fledged JDK
###
FROM maven:3.6-jdk-11-slim as BUILD

WORKDIR /app

# Update the distro, install git and finally clone spring-petclinic
RUN apt-get update -y && \
    apt-get install git -y && \
    git clone https://github.com/spring-projects/spring-petclinic.git

# Move into the application directory and build it through Maven.
WORKDIR /app/spring-petclinic
RUN mvn -T $(nproc) spring-javaformat:apply && \
    mvn -T $(nproc) clean package -DskipTests=true

###
# Ok, the application has been built. Now we build a container
# for the sole purpose of running the application.
# The running container just needs a JRE, not the full JDK.
###
FROM openjdk:11-jre-slim

WORKDIR /app
ARG JAR=spring-petclinic-*.BUILD-SNAPSHOT.jar

# Installing some minimal utilities.
RUN apt-get update -y && apt-get install -y procps

# Copy the built artifact from the previous image.
COPY --from=BUILD /app/spring-petclinic/target/$JAR app.jar

EXPOSE 8080 9090
ENTRYPOINT ["java"]
CMD ["-jar", "/app/app.jar"]

