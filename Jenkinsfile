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
    }
}
