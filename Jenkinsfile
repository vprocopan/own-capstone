pipeline {
    environment {
        dockerhubCredentials = 'dockerhubCredentials'
    }
    agent any

    stages {
        stage('Build') {
            steps {
                echo 'Building'
                sh '''docker run --name capstone -d -p 80:80 vprocopan/capstone-vprocopan'''
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