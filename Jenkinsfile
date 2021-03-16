pipeline {
    agent any

    stages {
        stage('Stage Build With Docker image') {
            steps {         
                sh "docker build . -t happyit/web2"
            }
        }

        stage('Stage Docker Hub Push') {
            steps { 
                withCredentials([string(credentialsId: 'docker_hub', variable: 'DockerHubPwd')]) {
                    sh "docker login -u happyit -p ${DockerHubPwd}"
                }               
                
                sh " docker push happyit/web2"
            }
        }
        
        stage('Stage Deploy With Ansible') {
            steps {
                ansiblePlaybook credentialsId: 'abc1df23-b934-48dd-93b9-7f5894abc5a3', disableHostKeyChecking: true, installation: 'ansible2', inventory: 'hosts.ini', playbook: 'apache.yml'
                
            }
        }
        
    }

}
