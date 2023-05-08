# JMeter Boilerplate

Boilerplate docker-compose with automatic configuration of InfluxDB, Grafana, Jenkins and JMeter

## Configuration

First, change the repository configuration (dummy-repository.git) in the `update-jenkins-jobs.xml` file. Next, make sure you have a `scripts` directory with jmeter scripts in the repository.

## Installing Dockerfile locally

```bash
docker build -t jenkinstaurus .

docker tag jenkinstaurus:latest jenkinstaurus:experimental
```

## Running

```bash
run.sh
```

## TODO

1. Podczas stawiania nowej instancji Jenkinsa, przez pierwsze ~5 minut ściągają się domyślnie pluginy, których nie wykorzystujemy. Zrobić research, czy można zablokować ściąganie ich w konfiguracji.
2. Globalną zmienną dla url repo
