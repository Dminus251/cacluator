pipeline{
    agent {
	docker {
            image 'docker:latest'
            args '--privileged' // Docker-in-Docker를 위해 필요한 권한 부여
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
		sh "docker exec -it dind docker build -t dminus251/calculator ."
	    }
	}
    }	
}
