pipeline {
    agent any
    stages {
        stage('git chekcout') {
          steps{                
	        git branch: 'deploy', url: 'https://github.com/manjarisri/ans.git'  
          }  
        }
        stage('Build stage') {
          steps {
           sh 'docker build -t manjarisri/todo:$BUILD_NUMBER .'
          }
        } 
	 stage('pushing image to dockerhub') {
          steps {
              withCredentials([string(credentialsId: 'docker', variable: 'pass')]) {
	        sh 'docker login -u manjarisri -p $pass' 
                sh 'docker push manjarisri/todo:$BUILD_NUMBER' 
              }
          }
        }    	
	    
        stage('ansible script') {
          steps{
	        sh 'ansible all -i inven.inv -m ping'
		sh 'ansible-playbook script.yaml -i inven.inv'		
          }  
        }
    }
}
