#!/bin/bash
test $(curl "http://localhost:8765/sum?a=100&b=172") -eq 272
