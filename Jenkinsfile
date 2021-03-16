pipeline {
    agent any
    environment {
      DOCKER_TAG = getVersion()
    }
    stages {
        stage('Stage Build With Docker image') {
            steps {         
                sh "docker build . -t happyit/web2:${DOCKER_TAG}"
            }
        }

        stage('Stage Docker Hub Push') {
            steps { 
                //withCredentials([string(credentialsId: 'docker_hub', variable: 'DockerHubPwd')]) {
                //    sh "docker login -u happyit -p ${DockerHubPwd}"
                //}               
                
                sh "docker login -u happyit -p Password@68"
                sh " docker push happyit/web2:${DOCKER_TAG}"
            }
        }
        
        stage('Stage Deploy With Ansible on Development Environment') {
            steps {
                ansiblePlaybook credentialsId: 'abc1df23-b934-48dd-93b9-7f5894abc5a3', disableHostKeyChecking: true, extras: "-e DOCKER_TAG=${DOCKER_TAG}", installation: 'ansible2', inventory: 'dev.inv', playbook: 'apache.yml'
                
            }
        }
        
    }

}

def getVersion(){
    def commitHash = sh label: '', returnStdout: true, script: 'git rev-parse --short HEAD'
    return commitHash
}
