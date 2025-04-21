pipeline {
    agent {
        label 'agent_jenkins_myBank'
    }

    stages {
        stage('ci') {
            steps {
                git branch: 'main', url: 'https://github.com/Sebastien0506/myBank.git'
            }
        }
        stage('install dependencies') {
            steps {
                sh 'composer install'
            }
        }
        stage('Run Test'){
            steps {
                sh 'php bin/phpunit'
            }
        }
    }
}