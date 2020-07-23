node {
stage ('Checkout SCM'){
git branch: 'master',url:'https://github.com/poornima608/eshop-angular.git'
}
stage ('Install node modules'){
powershell '''
npm i -f
'''
}
stage('Build'){
powershell
  '''
  ng build -prod
  '''
}
stage('Deploy'){
powershell '''
pm2 restart all
'''
}
}
