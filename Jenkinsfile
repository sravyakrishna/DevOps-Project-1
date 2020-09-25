node {
    stage('scm'){
        git 'https://github.com/sravyakrishna/DevOps-Project-1.git'
    }
    stage('build'){
        sh 'mvn package'
    }
    post
    {
        failure
        {
            emailext attachLog: true, body: "Please go to ${env.BUILD_URL} for more details.", subject: "Job ${env.JOB_NAME} - (${env.BUILD_NUMBER}) has FAILED", to: 'sainavateja1@gmail.com'
        }
        success
        {
            emailext attachLog: true, body: "Please go to ${env.BUILD_URL} for more details.", subject: "Job ${env.JOB_NAME} - (${env.BUILD_NUMBER}) has SUCCEDED", to: 'sainavateja1@gmail.com'
        }
    }
}
