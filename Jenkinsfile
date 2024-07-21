pipeline{
    agent {
        dockerContainer {
       	    image 'docker:latest'
            args '-v /var/run/docker.sock:/var/run/docker.sock'
       	}
    }
    stages{
        stage("Complie"){
            steps{
                sh "./gradlew compileJava"
            }
        }
        stage("Unit test"){
            steps{
                sh "./gradlew test"
            }
        }
	stage("Code coverage"){
	    steps{
		sh "./gradlew jacocoTestReport"
		sh "./gradlew jacocoTestCoverageVerification"
	    }
    	}
	stage("Static code analysis"){
	  steps{
		sh "./gradlew checkstyleMain"
	  }
	}
	stage("Docker build"){
	    steps{
		sh "apt-get install docker-ce docker-ce-cli containerd.io docker-compose-plugin"
		sh "docker build -t dminus251/calculator ."
	    }
	}
    }	
}
