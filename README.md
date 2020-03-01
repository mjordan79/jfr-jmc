# jfr-jmc
Java Flight Recorder (JFR) and Java Mission Control (JMC) Proof of Concept

1) Build Spring PetClinic Docker image with:
docker-compose build --no-cache --force-rm --parallel

2) Initialize a Docker Swarm Manager node (Single node cluster on local environment):
docker swarm init

3) Ensure the Swarm Mode is activated:
docker info | grep -Ei swarm

4) Deploy the service to the cluster:
docker stack deploy -c docker-compose.yml petclinic

You're ready to go. Open Java Mission Control 7 and connect to localhost:9090 to access the JVM metrics.
