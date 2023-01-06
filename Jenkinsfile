   
// pipeline {
//     agent any
//   parameters{
//     string(name: 'DEPLOYMENT_ENV', defaultValue: '', description: 'DEPLOYMENT_ENV is origin remote')
//     string(name: 'BRANCH_NAME', defaultValue: '', description: 'BRANCH_NAME git clone')
//   }


//   stages {
//     stage('Build - Deploy') {
//       steps {
//         sh 'echo Deploy ${params.DEPLOYMENT_ENV}' 
                
//       }
         
                

//     }
//   }
// }


pipeline {
  agent any
  parameters {
    string(name: 'BRANCH_NAME', defaultValue: '', description: 'Who should I say hello to?')
  }
  stages {
    stage('Example') {
      steps {
        sh "echo Hello ${params.BRANCH_NAME}"
      }
    }
  }
}
