pipeline {
    agent any

    stages {
        stage('Build') {
            steps {
                echo "This is Build stage"
            }
        }
        
        stage('Execute Ansible') {
            steps {
                ansiblePlaybook credentialsId: 'abc1df23-b934-48dd-93b9-7f5894abc5a3', disableHostKeyChecking: true, installation: 'ansible2', inventory: 'hosts.ini', playbook: 'apache.yml'
                
            }
        }
        
    }

}
