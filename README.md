# JMeter Boilerplate

Boilerplate docker-compose with automatic configuration of InfluxDB, Grafana, Jenkins and JMeter scripts.

## Configuration

First, change the repository configuration (dummy-repository.git) in the `update-jenkins-jobs.xml` file. Next, make sure you have a `scripts` directory with jmeter scripts in the repository.

## Installing Dockerfile locally

```bash
docker build -t jenkinstaurus .
```

## Running

```bash
run.sh
```
