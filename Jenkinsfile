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
                script {
                    sh 'hadolint ./Dockerfile | tee -a hadolint_lint.txt'
                            sh '''
                                lintErrors=$(stat --printf="%s"  hadolint_lint.txt)
                                if [ "$lintErrors" -gt "0" ]; then
                                    echo "Errors have been found, please see below"
                                    cat hadolint_lint.txt
                                    exit 1
                                else
                                    echo "There are no erros found on Dockerfile!!"
                                fi
                            '''
                }
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