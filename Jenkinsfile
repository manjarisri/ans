pipeline {
    agent any

    stages {
        stage('git chekcout') {
         steps{                
	        git branch: 'deploy', url: 'https://github.com/manjarisri/ans.git'  
		sh 'echo $pub_key > id_rsa.pub' 
         }  
        }
        stage('ansible script') {
         steps{
		 ansiblePlaybook credentialsId: 'd570ac07-10a3-40b5-95e7-6d8bcfe28b26', disableHostKeyChecking: true, installation: 'ubuntu', inventory: 'inven.yaml', playbook: 'script.yaml'
// 		 ansiblePlaybook credentialsId: '4cf364c0-96b9-4733-8e1c-b4d7bcada2fc', disableHostKeyChecking: true, installation: 'ubuntu', inventory: 'inven.yaml', playbook: 'script.yaml'
		 sh 'ansible all -i inven.yaml -m ping'
		 sh 'ansible-playbook script.yaml -i inven.yaml'
         }  
        }
    }
}
