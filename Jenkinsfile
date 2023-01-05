branch=$(git symbolic-ref HEAD | sed -e 's,.*/\(.*\),\1,')


pipeline {
    agent any

    stages {
        stage('Build - Deploy') {
            steps {
                sh 'echo Branch deployment is $branch '

            }
        }


    }


}
