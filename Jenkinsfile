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
      parallel {
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
        message "Which app should be shut down?"
        ok "Yes, we should."
        submitter "alice,bob"
        parameters {
          string(name: 'SHUTDOWN_CHOICE', defaultValue: 'both', description: 'Can be one of: app1 app2 both none')
        }
      }
      steps {
        echo "Shutdown choice is, ${SHUTDOWN_CHOICE}"
      }
    }
    
    stage('Shutdown') {
      when {
         environment name: 'SHUTDOWN_CHOICE', value: 'both'
            }
            steps {
              sh 'docker stop nginx2'
              sh 'docker stop nginx2'
            }
      
    }

    stage('Verify') {
      steps {
        sh ''
      }
    }

  }
  
  post {
      success {
        sh 'docker stop nginx1'
        sh 'docker stop nginx2'
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
