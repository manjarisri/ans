pipeline {
    agent any

    stages {
        stage('git chekcout') {
         steps{                
	        git branch: 'deploy', url: 'https://github.com/manjarisri/ans.git'                 
         }  
        }
        stage('ansible script') {
         steps{                
           ansiblePlaybook disableHostKeyChecking: true, installation: 'ec2', inventory: 'inven.yaml', playbook: 'script.yaml'     
           sh 'ansible-playbook script.yaml -i inven.yaml'
         }  
        }
    }
}
