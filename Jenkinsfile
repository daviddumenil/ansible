pipeline {
  agent {
    label 'master'
  }

  environment {
    // feature toggles are here
    runCDSDARContainerBuild = 'true'
  }

  options {
    //ansiColor('xterm')
    timestamps()
    timeout(time: 3, unit: 'HOURS')
  }

  stages {
    stage('Build') {
      steps {
        sh 'docker build .'
      }
    }
   
   stage('Tag') {
      steps {
        sh 'docker build .'
      }
    }

    stage('Push') {
      steps {
        sh 'docker push '
      }
    }

  }
}
