pipeline {
    agent any

    stages {
        stage('Checkout') {
            steps {
                script {
                    // Завантажити код з GitHub (включає файли з гілки main)
                    checkout scm
                }
            }
        }

        stage('Build and Deploy') {
            steps {
                script {
                    // Завантажити останній образ Docker
                    sh 'docker-compose pull'

                    // Побудувати та запустити контейнери
                    sh 'docker-compose up --build -d'

                
                }
            }
        }
        stage('Run tests against the container) {
            steps {
                sh 'curl http://172.18.0.0:8081
            }
        }
    }

    post {
        always {
            // Кроки очищення або додаткові дії після побудови
            sh 'docker-compose down'
        }
    }
}