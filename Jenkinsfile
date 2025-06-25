pipeline {
    agent any
    environment {
        CREDS = credentials('jenkins-id')
    }
    stages {
        stage('Build'){
            agent {
                kubernetes {
                    yamlFile './yaml/build.yaml'
                    defaultContainer 'podman'
                }
            }
            steps {
                sh "podman build -t sa-saopaulo-1.ocir.io/grdf8a1tnmjn/flask-app:latest ."
                //sh "podman tag flask-app sa-saopaulo-1.ocir.io/grdf8a1tnmjn/flask-app:latest"
            }
        }
        stage('Push'){
            agent {
                kubernetes {
                    yamlFile './yaml/build.yaml'
                    defaultContainer 'podman'
                }
            }
            steps {
                sh "podman images"
                sh "podman login sa-saopaulo-1.ocir.io -u ${CREDS_USR} -p ${CRED_PSW}"
                sh "podman push sa-saopaulo-1.ocir.io/grdf8a1tnmjn/flask-app:latest"
            }
        }
    }
}