docker-compose up -d influxdb grafana jenkins
echo "--------------------------------------------------------------------------------------"
echo "Jenkins dashboard http://localhost:8080/"
echo "Grafana dashboard http://localhost:3000/d/jmeter/jmeter-standard-dashboard/"
echo "--------------------------------------------------------------------------------------"
docker-compose run --rm prepare-jenkins bash /prepare-jenkins.sh
