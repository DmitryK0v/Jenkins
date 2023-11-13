pipeline {
  agent any
  stages {
    stage('Start container') {
      steps {
        sh 'docker compose up --build'
        sh 'docker compose ps'
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
      sh 'docker compose down --remove-orphans -v'
      sh 'docker compose ps'
    }
  }
}
