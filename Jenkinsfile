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
		 ansiblePlaybook credentialsId: '4cf364c0-96b9-4733-8e1c-b4d7bcada2fc', disableHostKeyChecking: true, installation: 'ubuntu', inventory: 'inven.inv', playbook: 'script.yaml'
		 sh 'ansible all -i inven.inv -m ping'
		 sh 'ansible-playbook script.yaml -i inven.inv'
         }  
        }
    }
}
