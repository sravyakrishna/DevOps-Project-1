pipeline{
   agent any
   envirorment{
       DOCKER_TAG = getDockerTag{}
    }
        stages
        {
        stage ('scm checkout')
        {
            steps
            {
                git 'https://github.com/sravyakrishna/DevOps-Project-1.git'
            }
        }
        
        stage ('Build')
        {
            steps
            {
                sh label: '', script: 'mvn package'
            }
        }

    stages{
      stage ('BUild Docker Image') {
          steps{
             sh " docker Build . -t shivadeshapathi/shiva-app:${DOCKER_TAG} "
         }
      }
      stage ('DockerHUB push') {
          steps{
              withCredentials([string(credentialsId: 'docker-hub', variable: 'dockerhubaccount')]) {
		           sh "docker login -u shivadeshapathi -p ${dockerhubaccount}"
			    }
		           echo "shivadeshapathi/shiva-app:${DOCKER_TAG}"
		           sh "docker push shivadeshapathi/shiva-app:${DOCKER_TAG}"
			    }	

           }
      
           stage ('Deploy to k8s'){
              steps{
                   sh "chmod +x changeTag.sh"
                   sh "./changeTag.sh ${DOCKER_TAG}"
                   sshagent (['kubemaster']) {
                   sh 'scp -o StrictHostKeyChecking=no Services.yaml pods.yaml ubuntu@3.16.13.122:/home/ubuntu/'
                           script{
			try{
				sh 'ssh ubuntu@3.16.13.122 kubectl apply -f .'
				}
                catch(error){
				sh 'ssh ubuntu@3.16.13.122 kubectl create -f .'
				}
		    }
		
         }

      }
    
     }

     }
    
   }
} 

    def getDockerTag(){
    def tag = sh script: 'git rev-parse HEAD', returnStdout: true
	return tag
}
