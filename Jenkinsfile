pipeline {
    agent any
    environment {
        CREDS = credentials('jenkins-bitbucket-id')
    }
    stages {
        stage('Build'){
            agent {
                kubernetes {
                    yamlFile './yaml/build.yaml'
                    defaultContainer 'jnlp'
                }
            }
            steps {
                sh "docker build -t flask-app ."
                sh "docker tag flask-app sa-saopaulo-1.ocir.io/grdf8a1tnmjn/flask-app:latest"
            }
        }
        stage('Push'){
            steps {
                sh "docker login sa-saopaulo-1.ocir.io -u ${CREDS_USR} -p ${CRED_PSW}"
                sh "docker push sa-saopaulo-1.ocir.io/grdf8a1tnmjn/flask-app:latest"
            }
        }
    }
}