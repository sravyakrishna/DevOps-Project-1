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
                sh 'docker run -d -it --name shivaubuntu ubuntu'
     }
   }
       stage ('Docker Push')
	   {
	    steps{
		    withCredentials([string(credentialsId: 'dockerhub-shiva', variable: 'dockerhubpwd')]) {
                      sh "docker login -u shivadeshapathi -p ${dockerhubpwd}"
}
    sh label: '', script: 'docker commit shivaubuntu1 shivadeshapathi/shivaubuntu + ":$BUILD_NUMBER"
	sh label: '', script: 'docker push shivadeshapathi/shivaubuntu' + ":$BUILD_NUMBER"
    }
        }
    }
  }
