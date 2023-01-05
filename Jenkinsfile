git_branch = env.BRANCH_NAME
pipeline {
    agent any

    stages {
        stage('Build - Deploy') {
            steps {
                echo 'Branch deployment is : ' + git_branch
                echo 'Checkout Branch'
                if (git_branch = "origin/master") {
                   sh 'ansible-playbook -i inventory/hosts appspec.yml -vvv'

                } else {
                    sh 'ansible-playbook -i inventory/hosts appspec-01.yml -vvv'
                }
                 
            }
                

        }
    }


}
