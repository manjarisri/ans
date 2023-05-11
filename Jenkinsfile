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
		 script {
// 		 ansiblePlaybook credentialsId: '4cf364c0-96b9-4733-8e1c-b4d7bcada2fc', disableHostKeyChecking: true, installation: 'ubuntu', inventory: 'inven.yaml', playbook: 'script.yaml'
	         ansiblePlaybook credentialsId: '9a352752-57a6-498c-b58a-654e9f6a48b2', disableHostKeyChecking: true, installation: 'ubuntu', inventory: 'inven.yaml', playbook: 'script.yaml'
		 sh 'ansible all -i inven.yaml -m ping'
		 sh 'ansible-playbook script.yaml -i inven.yaml'
         }  
        }
    }
}
