pipeline {
  agent any
  stages {

    stage("GIT CHECKOUT") {
      steps {
        echo "cloning the git repo"
        git branch: "main", url: "https://github.com/hzahid500/django-app-deployment.git"
      }
    }

    stage("BUILD") {
      steps {
        echo "building the docker image"
        sh "docker build -t django-app:latest ."
      }
    }

    stage("PUSH") {
      steps {
        echo "pushing image to docker hub"
        withCredentials([usernamePassword(credentialsId:"dockerHub",usernameVariable:"dockerHubUser",passwordVariable:"dockerHubPass")]) {
          sh "docker tag django-app:latest ${env.dockerHubUser}/django-app:latest"
          sh "docker login -u ${env.dockerHubUser} -p ${env.dockerHubPass}"
          sh "docker push ${env.dockerHubUser}/django-app:latest"
        }
      }
    }

    stage("DEPLOY") {
      steps {
        echo "deploying the container"
        sh "docker run -d -p 3000:3000 --name django-app:v1.0 django-app:latest"
      }
    }
  }
}
