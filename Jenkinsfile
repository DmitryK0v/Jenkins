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
            environment {
	    	//main db
		DB_HOST='postgres'
		POSTGRES_DB='schedule'
		POSTGRES_USER=s'chedule'
		POSTGRES_PASSWORD='pass'
		
		//db test
		TEST_DB_HOST='172.18.0.2'
		TEST_DB_NAME='schedule_test'
		TEST_DB_USERNAME='schedule'
		TEST_DB_PASSWORD='D52PuG70kx(E?}evtAe03wl2b1JbF(R6'
		
		//jwt
		JWT_SECRET='jwtsecret'
		JWT_EXPIRED='86400000'
		
		//redis
		REDIS_HOST='redis'
		
		//mongo db
		MONGO_DATABASE='schedules'
		MONGO_SERVER='mongo'

		//LOCAL_URL='http://localhost:3000/'
		//HEROKU_URL='https://softservedemo.herokuapp.com/'
		//BACKEND_URL='https://develop-softserve.herokuapp.com/'
		//MAIL_USERNAME='env.username'
		//MAIL_PASSWORD='env.password'


		//FACEBOOK_CLIENT_ID=748342852383540
		//FACEBOOK_CLIENT_SECRET=7eacc027056ac2cacdf3ed456598f37e
		//GOOGLE_CLIENT_ID=593111454680-500ngi1n2a054g480rh8nh53j4b4lb3a.apps.googleusercontent.com
		//GOOGLE_CLIENT_SECRET=QUp7QSh8FmciiuA6hjT0EBzV
		//TEST_LOCAL_URL=http://localhost:3000/
		//TEST_HEROKU_URL=https://softservedemo.herokuapp.com/
		//TEST_MAIL_USERNAME=lastvova123@gmail.com
		//TEST_MAIL_PASSWORD=softserve1
	    }
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
