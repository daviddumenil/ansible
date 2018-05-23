pipeline {
  agent {
    label 'master'
  }

  environment {
    // feature toggles are here
    runCDSDARContainerBuild = 'true'
  }

  options {
    ansiColor('xterm')
    timestamps()
    timeout(time: 3, unit: 'HOURS')
  }

  stages {
    stage('Build') {
      sh 'docker build .'
    }
   
   stage('Tag') {
      sh 'docker build .'
    }

    stage('Push') {
      //sh 'docker push '
    }

  }
}
