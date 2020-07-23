node {
         stage ('Checkout SCM'){
                    git branch: 'master',url: 'https://github.com/poornima608/eshop-angular.git'
         }
         
         stage('Install node modules'){
                      bat "npm install"
         }
         stage('Build'){
                     bat "npm run ng -- build --prod"
         }
         stage('Approval') {
         // no agent, so executors are not used up when waiting for approvals
         agent none
         steps {
             script {
                 def deploymentDelay = input id: 'Deploy', message: 'Deploy to production?', submitter: 'rkivisto,admin', parameters: [choice(choices: ['0', '1', '2', '3', '4', '5', '6', '7', '8', '9', '10', '11', '12', '13', '14', '15', '16', '17', '18', '19', '20', '21', '22', '23', '24'], description: 'Hours to delay deployment?', name: 'deploymentDelay')]
                 sleep time: deploymentDelay.toInteger(), unit: 'HOURS'
             }
         }
     }
        stage('AWS Connection and Deployment'){
            steps{
                   sshagent(['AWS_EC2']) {
                   sh ' ssh -o StrictHostKeyChecking=no ubuntu@52.3.249.19'
               }
            }
        }
