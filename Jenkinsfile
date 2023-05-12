pipeline {
    agent any
    stages {
        stage('git chekcout') {
         steps{                
	        git branch: 'deploy', url: 'https://github.com/manjarisri/ans.git'  
         }  
        }
       stage('Buildingstage') {
         steps {
           sh 'docker build -t manjarisri/todo:$BUILD_NUMBER .'
         }
      } 
        stage('Pushnig image to dockerhub') {         
         steps{   
            withCredentials([usernamePassword(credentialsId: 'dockerhubcred', variable: 'Manjari04')]){
		    sh 'docker login -u manjarisri -p ${variable}' 
                    sh 'docker push manjarisri/todo:$BUILD_NUMBER'       
         }            
	 } 
      }
        stage('ansible script') {
         steps{
// 		 ansiblePlaybook credentialsId: '9a352752-57a6-498c-b58a-654e9f6a48b2', disableHostKeyChecking: true, installation: 'ubuntu', inventory: 'inven.inv', playbook: 'script.yaml'
		  sh 'ansible all -i inven.inv -m ping'
		 sh 'ansible-playbook script.yaml -i inven.inv'
         }  
        }
    }
}
