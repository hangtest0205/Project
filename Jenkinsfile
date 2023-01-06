// properties([
//   parameters([
//     string(
//         defaultVaule: '',
//         name:'DEPLOYMENT_ENV',
//         trim: true,
//         description: 'DEPLOYMENT_ENV is origin remote'),
//     string (
//         defaultVaule: '',
//         name:'BRANCH_NAME',
//         trim: true,
//         description: 'BRANCH_NAME git clone'),
//   ])
// ])

 properties([
   parameters([
     text(DEPLOYMENT_ENV:'DEPLOYMENT_ENV', BRANCH_NAME: 'BRANCH_NAME' )
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
