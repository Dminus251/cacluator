#!/bin/bash

#curl 결과를 result 변수에 저장
result=$(docker exec calcForStaging curl -s "http://localhost:8081/sum?a=100&b=172")

# 기대값을 설정: 100+172=272
expected=272

# 결과값이 기대값과 동일한지 체크
if [ "$result" -eq "$expected" ]; then
    exit 0 #pass
else
    echo "Test failed: $result does not equal $expected"
    exit 1
fi

