node {
stage ('Checkout SCM'){
git branch: 'master',url:'https://github.com/poornima608/eshop-angular.git'
}
stage ('Install node modules'){
bat '''
npm i -f
'''
}
stage('Build'){
bat
  '''
  ng build
  '''
}
stage('Deploy'){
bat '''
pm2 restart all
'''
}
}
