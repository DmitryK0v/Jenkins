pipeline {
    agent any
    environment {
    	DB_HOST= 'postgres'
	POSTGRES_DB= 'schedule'
	POSTGRES_USER= 'schedule'
	POSTGRES_PASSWORD= 'pass'
	TEST_DB_HOST= '172.18.0.2'
	TEST_DB_NAME= 'schedule_test'
	TEST_DB_USERNAME= 'schedule'
	TEST_DB_PASSWORD= 'D52PuG70kx(E?evtAe03wl2b1JbF(R6'
	JWT_SECRET= 'jwtsecret'
	JWT_EXPIRED= '86400000'
	REDIS_HOST= 'redis'
	MONGO_DATABASE= 'schedules'
	MONGO_SERVER= 'mongo'
    }
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
                    		sh 'docker-compose up --build'
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
