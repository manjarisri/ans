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
	 stage('pushing image to dockerehub') {
          steps {
              withCredentials([string(credentialsId: 'docker', variable: 'pass')]) {
	        sh 'docker login -u manjarisri -p $pass' 
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
    post {
        always {
          script {
                sh 'echo "Deployment complete"'
                currentBuild.result = 'SUCCESS'
                sh 'kill -9 %$(pgrep -f jenkinsfile)'
          }
        }
    }
}
