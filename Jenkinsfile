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
      parrallel {
        stage('Run App1') {
          steps {
            sh 'docker run --name nginx1 -d -p 8091:80 nginx'
          }
        }
        stage('Run App2') {
          steps {
            sh 'docker run --name nginx2 -d -p 8092:80 nginx'
          }
        }
      }
    }
   
   stage('Test') {
      parrallel {
        stage('Test App1') {
          steps {
            sh 'curl --fail http://localhost:8091/'
          }
        }
        stage('Test App2') {
          steps {
            sh 'curl --fail http://localhost:8092/'
          }
        }
      }
    }

    stage('Query') {
      input {
        message "Should we continue?"
        ok "Yes, we should."
        submitter "alice,bob"
        parameters {
          string(name: 'PERSON', defaultValue: 'Mr Jenkins', description: 'Who should I say hello to?')
        }
      }
      steps {
        echo "Hello, ${PERSON}, nice to meet you."
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
        sh 'docker stop nginx2
      }
      failure {
        sh 'docker stop nginx1'
        sh 'docker stop nginx2'
      }
      aborted {
        sh 'docker stop nginx1'
        sh 'docker stop nginx2'
      }
  }

}
