pipeline {
    agent any
    
    tools {
        maven 'Maven'
    }
    
    stages {
        stage('GIT') {
            steps {
                echo 'Getting Project from Git'
                git branch: 'main',
                    url: 'https://github.com/yakoubiemna705-commits/timesheet-emna-yacoubi-4nids3.git'
            }
        }
        
        stage('MVN CLEAN') {
            steps {
                sh 'mvn clean'
            }
        }
        
        stage('MVN COMPILE') {
            steps {
                sh 'mvn compile'
            }
        }
        
        stage('MVN SONARQUBE') {
            steps {
                withSonarQubeEnv('SonarQube') {
                    sh 'mvn sonar:sonar'
                }
            }
        }
    }
    
    post {
        always {
            echo 'Pipeline finished'
        }
        success {
            echo 'Build succeeded!'
        }
        failure {
            echo 'Build failed!'
        }
    }
}
