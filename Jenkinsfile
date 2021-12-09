pipeline {
    environment {
        dockerhubCredentials = 'dockerhubCredentials'
    }
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building'
                sh '''echo test'''
            }
        }
        stage('Test') {
            steps {
                echo 'Testing..'
            }
        }
        stage('Deploy') {
            steps {
                echo 'Deploying....'
            }
        }
    }
}