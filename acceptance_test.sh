#!/bin/bash

# curl을 통해 컨테이너 내부에서 HTTP 요청을 보내고, 그 결과를 변수 result에 저장합니다.
result=$(docker exec calcForStaging curl -s "http://localhost:8081/sum?a=100&b=172")

# 기대값을 설정합니다.
expected=272

# 결과값이 기대값과 동일한지 비교합니다.
if [ "$result" -eq "$expected" ]; then
    echo "Test passed: $result equals $expected"
else
    echo "Test failed: $result does not equal $expected"
    exit 1
fi

