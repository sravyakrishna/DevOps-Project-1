stages {
     stage('Docker Pull') {
            steps {
                sh label: '', script: 'docker pull tomcat:latest'
            }
        }
       stage('Docker Run') {
           agent any
           steps {
                sh 'docker run -d -it --name shivatomcat tomcat'
     }
   }
       

