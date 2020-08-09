pipeline {
  environment {
    registry = "poornii/eshop-angular"
    registryCredential = 'dockerhub'
    dockerImage = ''
  }
  agent any
  stages{
    stage ('Build') {
      steps{
        echo "Building Project"
        nodejs('nodejs') {
        // sh 'npm install'
        // sh 'npm run build'
        sh 'npm rebuild node-sass'
         // sh 'ng serve'
        }
      }
    }
  //  stage ('Archive') {
   //   steps{
   //     echo "Archiving Project"
   //     archiveArtifacts artifacts: '*/.jar', followSymlinks: false
   //   }
  //  } 
    stage ('Build Docker Image') {
      steps{
        echo "Building Docker Image"
        script {
          dockerImage = docker.build registry + ":$BUILD_NUMBER"
        }
      }
    }
    stage ('Push Docker Image') {
      steps{
        echo "Pushing Docker Image"
        script {
          docker.withRegistry( '', registryCredential ) {
              dockerImage.push()
              dockerImage.push('latest')
          }
        }
      }
    }
    stage ('Deploy to Dev') {
      steps{
        echo "Deploying to Dev Environment"
        sh "docker rm -f eshop-angular || true"
        sh "docker run -d --name=eshop-angular -p 4200:8080 poornii/eshop-angular"
      }
    }
  }
}
