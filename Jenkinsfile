pipeline {
    agent {
 	docker {
            image 'gradle:jdk17'
            args '--privileged -v /var/run/docker.sock:/var/run/docker.sock' // 필요 시 추가적인 권한을 부여
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

