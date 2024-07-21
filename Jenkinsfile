pipeline {
    agent {
        docker {
            image 'dminus251/jenkins-docker-agent:latest'
            args '--privileged -v /var/run/docker.sock:/var/run/docker.sock'
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
		    
 		    sh 'cp build/libs/calculator-0.0.1-SNAPSHOT.jar .'

                    // Build Docker image
                    sh 'docker build -t dminus251/calculator:2 .'
                }
            }
        }
    }
}

