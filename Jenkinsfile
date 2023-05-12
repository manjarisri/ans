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
// 		 ansiblePlaybook credentialsId: '9a352752-57a6-498c-b58a-654e9f6a48b2', disableHostKeyChecking: true, installation: 'ubuntu', inventory: 'inven.inv', playbook: 'script.yaml'
		 sh 'pwd'
		  sh 'ansible all -i inven.inv -m ping'
		 sh 'ansible-playbook script.yaml -i inven.inv -vvv'
         }  
        }
    }
}
