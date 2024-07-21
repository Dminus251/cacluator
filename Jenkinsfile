pipeline {
    agent {
 	docker {
            image 'gradle:latest'
            args '-v /var/run/docker.sock:/var/run/docker.sock'  // Docker 소켓 공유
        }
    }
    stages {
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
        stage('Docker Build') {
            steps {
                script {
                    // Ensure Docker is available
                    sh 'docker --version'
                    
                    // Build Docker image
                    sh 'docker build -t dminus251/calculator .'
                }
            }
        }
    }
}

