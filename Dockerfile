# Dockerfile
FROM openjdk:17-slim

# Docker 클라이언트 설치
RUN apt-get update && \
    apt-get install -y docker.io

# JAR 파일을 이미지에 복사
COPY build/libs/calculator-0.0.1-SNAPSHOT.jar app.jar

# Jenkins가 Docker를 사용할 수 있도록 권한 설정
USER root

# 컨테이너가 시작될 때 JAR 파일을 실행하도록 설정
ENTRYPOINT ["java", "-jar", "app.jar"]

