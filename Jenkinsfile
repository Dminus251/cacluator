pipeline {
    agent {
 	docker {
   	    image 'docker:20.10-dind'  // DinD 이미지를 사용
            args '--privileged'        // Docker-in-Docker를 사용할 때 필요한 권한
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

