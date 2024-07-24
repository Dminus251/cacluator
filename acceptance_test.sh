#!/bin/bash
test $(curl "http://calcForStaging:8081/sum?a=100&b=172") -eq 272

