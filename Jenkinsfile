pipeline {
  agent {
    label 'master'
  }

  environment {
    CHOICE = ''
  }

  options {
    //ansiColor('xterm')
    timestamps()
    timeout(time: 3, unit: 'HOURS')
  }

  stages {
    stage('Run') {
      steps {
        sh 'docker run --name nginx1 -d -p 8090:80 nginx'
      }
    }
   
   stage('Test') {
      steps {
        sh 'curl --fail http://localhost:8090/'
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
  
  post {
      success {
        sh 'docker stop nginx1'
      }
      failure {
        sh 'docker stop nginx1'
      }
      aborted {
        sh 'docker stop nginx1'
      }
  }

}
