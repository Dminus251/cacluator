#!/bin/bash
CONTAINER_IP=$(docker inspect -f '{{range .NetworkSettings.Networks}}{{.IPAddress}}{{end}}' calcForStaging)
RESPONSE=$(curl -s "http://$CONTAINER_IP:8081/sum?a=100&b=172")
echo "CONTAINER_IP: $CONTAINER_IP" 
echo "Response: $RESPONSE"
test "$RESPONSE" -eq 272

