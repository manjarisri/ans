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
                 ansiblePlaybook credentialsId: 'd0b55484-31ee-4382-81fd-4bd65411701e', disableHostKeyChecking: true, installation: 'ubuntu', inventory: 'inven.yaml', playbook: 'script.yaml'
		 sh 'ansible-playbook script.yaml -i inven.yaml'
         }  
        }
    }
}
