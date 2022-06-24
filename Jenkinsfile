pipeline {

  agent any

  environment {
    DOCKER_IMAGE = "huyhuy8122001/hello-there"
    DOCKER_TAG="${GIT_BRANCH.tokenize('/').pop()}-${BUILD_NUMBER}-${GIT_COMMIT.substring(0,6)}"
    
    // DockerHub Login
    DOCKERHUB_CREDENTIALS = credentials('docker-hub')
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
        sh """
          echo $DOCKERHUB_CREDENTIALS_PSW 
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
