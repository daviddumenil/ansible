pipeline {
  agent {
    label 'master'
  }

  environment {
  }

  options {
    //ansiColor('xterm')
    timestamps()
    timeout(time: 3, unit: 'HOURS')
  }

  stages {
    stage('Run') {
      steps {
        sh 'docker run --name nginx -d -p 8090:80 nginx'
      }
    }
   
   stage('Test') {
      steps {
        sh 'curl http://localhost:8090/'
      }
    }

    stage('Query') {
      steps {
        sh 'docker push '
      }
    }

    stage('Verify') {
      steps {
        sh 'docker push '
      }
    }

  }
}
