pipeline {
    environment {
        dockerhubCredentials = 'dockerhubCredentials'
    }
    agent any

    stages {
        stage('Build and Push') {
            steps {
                script{
                    echo 'Building'
                sh 'docker build -t vprocopan/capstone-vprocopan .'
                docker.withRegistry( '', dockerhubCredentials ) {
                
                    sh 'docker push vprocopan/capstone-vprocopan'
                    }
                sh '''docker run --name capstone -d -p 80:80 vprocopan/capstone-vprocopan'''
                
                }
                
            }
        }
        stage('Test') {
            steps {
                script {
                    sh 'hadolint ./Dockerfile | tee ./hadolint_lint.txt'
                            sh '''
                                lintErrors=$(stat --printf="%s"  ./hadolint_lint.txt)
                                if [ "$lintErrors" -gt "0" ]; then
                                    echo "Errors have been found, please see below"
                                    cat ./hadolint_lint.txt
                                    exit 1
                                else
                                    echo "There are no erros found on Dockerfile!!"
                                fi
                            '''
                }
                echo 'Testing..'
            }
        }
        stage('Deploy to EKS') {
            steps {
                dir('k8s') 
                {
                    withAWS(credentials: 'aws-credentials', region: 'us-west-2') 
                     {
                         sh "aws eks --region us-west-2 update-kubeconfig --name capstone"
                     }
                }
                echo 'Deploying....'
            }
        }
        stage("Cleaning Docker up") {
            steps {
                script {
                    sh "echo 'Cleaning Docker up'"
                   // sh "docker rm -f capstone"
                    sh "echo > hadolint_lint.txt"
                }
            }
        }
    }
}