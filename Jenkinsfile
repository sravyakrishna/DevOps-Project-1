pipeline {
  agent any
  stages {
     stage('Docker Pull') {
            steps {
                sh label: '', script: 'docker pull ubuntu:latest'
            }
        }
       stage('Docker Run') {
           agent any
           steps {
                sh 'docker run -d -it --name runubuntu ubuntu'
     }
   }
       stage ('Docker Push')
	   {
	    steps{
		withCredentials([string(credentialsId: 'docker-hub', variable: 'docker hub pwd')]) {
    sh "docker login -u shivadeshapathi -p ${docker hub pwd}"
    }
    sh label: '', script: 'docker commit runubuntu shivadeshapathi/runubuntu' + ":$BUILD_NUMBER"
	sh label: '', script: 'docker push shivadeshapathi/runubuntu' + ":$BUILD_NUMBER"
    }
        }
    }
  }
