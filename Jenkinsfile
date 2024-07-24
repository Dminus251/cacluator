pipeline {
    agent {
	docker {
		image 'dminus251/jenkins-docker-agent:using_socket'
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
                    sh 'docker build -t dminus251/calculator:latest .'
                }
            }
        }
	stage("Deploy to staging"){
	  steps{
	    sh "docker run -d --rm -p 8765:8080 dminus251/calculator:latest"
	  }
	}
	stage("Acceptance test"){
	  steps{
	    sleep 60 //docker run이 확실히 실행될 때까지 기다림
	    sh "chmod +x acceptance_test.sh && ./acceptance_test.sh"
	  }  
	}
    }
    //까지 stages
    post{
	always{
	  sh "docker stop calculator"
	}
    }
}
