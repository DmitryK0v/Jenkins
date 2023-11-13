pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                script {
                    checkout scm
                }
            }
        }

        stage('Build and Deploy') {
            steps {
                script {
                	dir('docker-compose'){
                    		sh 'docker-compose pull'
                    		sh 'docker-compose up --build -d'

                	}
                }
            }
        }
        stage('Run tests against the container') {
            steps {
                sh 'curl http://172.18.0.0:8081'
            }
        }
    }

    post {
        always {
            sh 'docker-compose down'
        }
    }
}
