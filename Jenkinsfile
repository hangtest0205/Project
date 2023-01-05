branch=$(git branch | sed -n -e 's/^\* \(.*\)/\1/p')


pipeline {
    agent any

    stages {
        stage('Build - Deploy') {
            steps {
                sh 'echo BRANCH_NAME ${branch} '

            }
        }


    }


}
