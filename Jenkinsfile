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
        
        stage('NEXUS DEPLOY') {
            steps {
                sh 'mvn deploy -DskipTests'
            }
        }
        
        stage('BUILDING IMAGE') {
            steps {
                sh 'mvn package -DskipTests'
                sh 'docker build -t emnayacoubi/timesheet:1.0.0 .'
            }
        }
        
        stage('DEPLOY IMAGE') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'dockerhub-credentials',
                    usernameVariable: 'DOCKER_USER',
                    passwordVariable: 'DOCKER_PASS'
                )]) {
                    sh 'echo $DOCKER_PASS | docker login -u $DOCKER_USER --password-stdin'
                    sh 'docker push emnayacoubi/timesheet:1.0.0'
                }
            }
        }
        
        stage('DOCKER COMPOSE') {
            steps {
                sh 'docker compose down || true'
                sh 'docker compose up -d'
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
