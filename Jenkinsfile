repo = 'https://github.com/hangtest0205/Project.git'
branch = 'main'

pipeline {
    agent any
    stages {
        stage("GitSCM") {
            steps {
                checkout([$class: 'GitSCM',
                          userRemoteConfigs: [[url: repo]],
                          branches: [[name: branch]],
                         ])
            }
        }
        
        stage("shorthand") {
            steps {
                git url: repo, branch: branch
            }
        }
    }
}
