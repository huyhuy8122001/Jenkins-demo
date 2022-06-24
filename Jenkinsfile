pipeline {

  agent any

  environment {
    DOCKER_IMAGE = "huyhuy8122001/hello-there"
    DOCKER_TAG="${GIT_BRANCH.tokenize('/').pop()}-${BUILD_NUMBER}-${GIT_COMMIT.substring(0,6)}"
  }

  stages {
    stage("build") {

      steps {
        sh """
          docker build -t ${DOCKER_IMAGE}:${DOCKER_TAG} .
        """
      }
    }

    stage("run") {
      steps {
          sh """
            docker run --rm ${DOCKER_IMAGE}:${DOCKER_TAG}
          """
      }
    }

    stage("Clean up") {
      steps {
          sh """
            sh "docker image rm ${DOCKER_IMAGE}:${DOCKER_TAG}"
          """
      }
    }
    
  }

}
