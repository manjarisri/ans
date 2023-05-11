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
           ansiblePlaybook credentialsId: '6ab71271-40b9-4cb0-b7ed-75a15a00b949', disableHostKeyChecking: true, installation: 'ec2', inventory: 'inven.yaml', playbook: 'script.yaml'     
           sh 'ansible-playbook script.yaml -i inven.yaml'
         }  
        }
    }
}
