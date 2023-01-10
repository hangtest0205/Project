def DEPLOYMENT_ENV

pipeline {
  agent any
  parameters {
    string(name: 'DEPLOYMENT_ENV', defaultValue: '', description: 'DEPLOYMENT_ENV is origin remote')
//     string(name: 'BRANCH_NAME', defaultValue: '', description: 'BRANCH_NAME git clone')
    
  }
  stages {
    stage('Example') {
      steps {
        sh "ansible-playbook -i inventory/hosts appspec.yml --extra-vars ${params.DEPLOYMENT_ENV}"
      }
    }
  }
}
