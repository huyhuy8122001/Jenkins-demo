pipeline {

  agent any

  environment {
    DOCKER_IMAGE = "huyuy8122001/hello-there"
  }

  stages {
    stage("build") {

      environment {
        DOCKER_TAG="${GIT_BRANCH.tokenize('/').pop()}-${BUILD_NUMBER}-${GIT_COMMIT.substring(0,7)}"
      }

      steps {
        // sh """
        //   docker build -t hello_there .
        // """
        echo 'Name of docker image is ${DOCKER_IMAGE}'
        echo 'Tag of docker image is ${DOCKER_TAG}'
      }
    }
    // stage("run") {
    //   steps {
    //       sh """
    //         docker run --rm hello_there
    //       """
    //   }
    // }
  }
}
