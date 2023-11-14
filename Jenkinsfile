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
                	    	sh 'echo DB_HOST=postgres >> .env'
				sh 'echo POSTGRES_DB=schedule >> .env'
				sh 'echo POSTGRES_USER=schedule >> .env'
				sh 'echo POSTGRES_PASSWORD=pass >> .env'
				sh 'echo TEST_DB_HOST=172.18.0.2 >> .env'
				sh 'echo TEST_DB_NAME=schedule_test >> .env'
				sh 'echo TEST_DB_USERNAME=schedule >> .env'
				sh 'echo TEST_DB_PASSWORD=D52PuG70kx(E?evtAe03wl2b1JbF(R6 >> .env'
				sh 'echo JWT_SECRET=jwtsecret >> .env'
				sh 'echo JWT_EXPIRED=86400000 >> .env'
				sh 'echo REDIS_HOST=redis >> .env'
				sh 'echo MONGO_DATABASE=schedules >> .env'
				sh 'echo MONGO_SERVER=mongo >> .env'
				sh 'cat .env'
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
