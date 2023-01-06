properties([
  parameters([
    string(
        defaultVaule: '',
        name:'DEPLOYMENT_ENV',
        trim: true,
        description: 'DEPLOYMENT_ENV is origin remote'),
    string (
        defaultVaule: '',
        name:'BRANCH_NAME',
        trim: true,
        description: 'BRANCH_NAME git clone'),
  ])
])

//  properties([
//    parameters([
    
//      text(description:'DEPLOYMENT_ENV', name: 'BRANCH_NAME' ),
//    ])
//  ])

   
pipeline {
    agent any

    stages {
        stage('Build - Deploy') {
            steps {
                sh 'ansible-playbook -i inventory/hosts appspec.yml -vvv' 
                
            }
         
                

        }
    }


}
