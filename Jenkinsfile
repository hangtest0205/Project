   
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
    string(name: 'DEPLOYMENT_ENV', defaultValue: '', description: 'DEPLOYMENT_ENV is origin remote')
    string(name: 'BRANCH_NAME', defaultValue: '', description: 'BRANCH_NAME git clone')
    
  }
  stages {
    stage('Example') {
      steps {
        sh "${params.BRANCH_NAME}"
        sh "${params.DEPLOYMENT_ENV}"
      }
    }
  }
}
