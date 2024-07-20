pipeline{
    agent any
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
		sh "docker build -t dminus251/calculator ."
	    }
	}
    }	
}
