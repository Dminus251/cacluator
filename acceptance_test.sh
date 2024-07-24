#!/bin/bash
CONTAINER_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' calcForStaging)
test $(curl -s "http://$CONTAINER_IP:8081/sum?a=100&b=172") -eq 272

