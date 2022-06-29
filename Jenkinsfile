pipeline{

  agent any

  environment {
    DOCKER_IMAGE = "huyhuy8122001/hello-there"
    DOCKER_TAG="${GIT_BRANCH.tokenize('/').pop()}-${BUILD_NUMBER}-${GIT_COMMIT.substring(0,6)}"
    
    // DockerHub Login
    //DOCKERHUB_CREDENTIALS = credentials('docker-hub')
  }

  stages {
    stage("Build") {

      steps {
        sh """
          docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .
        """
        // sh "docker push ${DOCKER_IMAGE}:${DOCKER_TAG}"

      }
    }

    stage("Login") {
      steps {
        // Login cach 1
        // sh """
        //   echo $DOCKERHUB_CREDENTIALS_PSW | docker login -u $DOCKERHUB_CREDENTIALS_USR --password-stdin
        // """
        
        // Login cach 2
        // withCredentials([usernamePassword(credentialsId: 'docker-hub', usernameVariable: 'DOCKER_USERNAME', passwordVariable: 'DOCKER_PASSWORD')]) {
        //     sh 'echo $DOCKER_PASSWORD | docker login --username $DOCKER_USERNAME --password-stdin'
        // }

        // Login cach 3    cat /var/jenkins_home/workspace/BuildAndRun/my_password.txt
        // sh """
        //   cat /var/jenkins_home/workspace/BuildAndRun/my_password.txt | docker login --username huyhuy8122001 --password-stdin
        // """
        sh """
          docker login --username huyhuy8122001 --password-stdin < /var/jenkins_home/workspace/BuildAndRun/my_password.txt
        """
      }
    }

    // stage("run") {
    //   steps {
    //       sh """
    //         docker run --rm ${DOCKER_IMAGE}:${DOCKER_TAG}
    //       """
    //   }
    // }

    stage("Clean up") {
      steps {
          sh """
            docker image rm ${DOCKER_IMAGE}:${DOCKER_TAG}
          """
      }
    }
    
  }

}
