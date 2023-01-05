git_branch = env.Branch_Name
pipeline {
    agent any

    stages {
        stage('Build - Deploy') {
            steps {
                echo 'Branch deployment is : ' + git_branch
                echo 'Checkout Branch'
                if (git_branch == "origin/master") {
                   sh 'ansible-playbook -i inventory/hosts appspec.yml -vvv'

                } else {
                    sh 'ansible-playbook -i inventory/hosts appspec.yml -vvv'
                }
                 
            }
                

        }
    }


}
