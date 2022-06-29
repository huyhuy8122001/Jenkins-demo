pipeline{

	agent {label 'master'}

	environment {
		DOCKERHUB_CREDENTIALS=credentials('docker-hub')
	}

	stages {
	    
	    stage('gitclone') {

			steps {
				git 'https://github.com/huyhuy8122001/Jenkins-Pipeline-Dockerhub.git'
			}
		}

		stage('Build') {

			steps {
				sh 'docker build -t huyhuy8122001/nodeapp_test:latest .'
			}
		}

		stage('Login') {

			steps {
				sh 'echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin'
			}
		}

		stage('Push') {

			steps {
				sh 'docker push huyhuy8122001/nodeapp_test:latest'
			}
		}
	}

	post {
		always {
			sh 'docker logout'
		}
	}

}