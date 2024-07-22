pipeline {
    agent {
	docker {
                image 'dminus251/jenkins-docker-agent:3'
                args '--privileged -v /var/run/docker.sock:/var/run/docker.sock'
                label 'docker-node-agent'
        }
    }
    stages {
        stage('Check Docker Installation') {
            steps {
                script {
                    sh 'which docker'
                    sh 'docker --version'
                }
            }
        }
        stage('Compile') {
            steps {
                sh './gradlew compileJava'
            }
        }
        stage('Unit Test') {
            steps {
                sh './gradlew test'
            }
        }
        stage('Code Coverage') {
            steps {
                sh './gradlew jacocoTestReport'
                sh './gradlew jacocoTestCoverageVerification'
            }
        }
        stage('Static Code Analysis') {
            steps {
                sh './gradlew checkstyleMain'
            }
        }
        stage('Build Jar') {
            steps {
                sh './gradlew build'
            }
        }
        stage('Docker Build') {
            steps {
                script {
                    // Docker가 설치됐는지 확인
                    sh 'docker --version'

                    // Build Docker image
                    sh 'docker build -t dminus251/calculator:2 .'
                }
            }
        }
    }
}

