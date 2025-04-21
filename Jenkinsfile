pipeline {
    agent {
        label 'agent_jenkins_myBank'
    }
    environment {
        DATABASE_URL = 'mysql://root:root@db:3306/myBank'
    }

    stages {
        stage('CI - Cloner le repo') {
            steps {
                git branch: 'main', url: 'https://github.com/Sebastien0506/myBank.git'
            }
        }

        stage('Installer les dépendances') {
            steps {
                dir('back/my-back-bank') {
                    sh 'composer install'
                }
            }
        }

        stage('Lancer les tests') {
            steps {
                dir('back/my-back-bank') {
                    sh 'php bin/phpunit'
                }
            }
        }
        
        stage('Générer une migration') {
            steps {
                dir('back/my-back-bank') {
                    sh 'php bin/console doctrine:migrations:sync-metadata-storage'
                    sh 'php bin/console make:migration'
                }
            }
        }
        stage('Migrer la database') {
            steps{
                dir('back/my-back-bank'){
                    sh 'php bin/console doctrine:migrations:migrate --no-interaction'
                }
            }
        }
    }
}