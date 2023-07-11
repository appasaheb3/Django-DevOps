pipeline {
    agent any
    stages {
        stage('Checkout') {
            steps {
                checkout scmGit(branches: [[name: '*/main']], extensions: [], userRemoteConfigs: [[url: 'https://github.com/appasaheb3/Django-DevOps.git']])
            }
        }
        
        stage('Build') {
            steps {
                sh 'docker build -t appasaheb3/django-devops .'
            }
        }
        stage('Push') {
            steps {
                withCredentials([usernamePassword(credentialsId: 'dockerhub', passwordVariable: 'DOCKER_HUB_PASSWORD', usernameVariable: 'DOCKER_HUB_USERNAME')]) {
                    sh 'echo $DOCKER_HUB_PASSWORD | docker login -u $DOCKER_HUB_USERNAME --password-stdin' 
                    sh 'docker push appasaheb3/django-devops'
                }
            }
        }
        stage('Deploy'){
            steps{
                sh 'docker run -d -p 5000:5000 appasaheb3/django-devops'
            }
        }
        
    }
}