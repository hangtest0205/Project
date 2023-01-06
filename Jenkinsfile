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
pipeline {
    agent any

    stages {
        stage('Build - Deploy') {
            steps {
                echo 'Branch deployment is : ' + git_branch
                echo 'Checkout Branch'
            }
         
                

        }
    }


}
