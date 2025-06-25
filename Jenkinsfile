pipeline {
    agent any
    //environment {
    //    CREDS = credentials('jenkins-bitbucket-id')
    //}
    stages {
        stage('Build'){
            agent {
                docker {
                    image 'quay.io/podman/stable'
                    args '-v /var/lib/containers:/var/lib/containers'
                }
            }
            steps {
                sh "podman build -t flask-app ."
                sh "podman tag flask-app sa-saopaulo-1.ocir.io/grdf8a1tnmjn/flask-app:latest"
            }
        }
        stage('Push'){
            agent {
                kubernetes {
                    yamlFile './yaml/build.yaml'
                    defaultContainer 'jnlp'
                }
            }
            steps {
                sh "docker login sa-saopaulo-1.ocir.io -u ${CREDS_USR} -p ${CRED_PSW}"
                sh "docker push sa-saopaulo-1.ocir.io/grdf8a1tnmjn/flask-app:latest"
            }
        }
    }
}