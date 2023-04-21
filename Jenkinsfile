pipeline{
    agent{ label 'dev-agent' } 
    stages{
        stage('Pull Code'){
            steps{
                git url: 'https://github.com/aviraln/django-todo.git', branch: 'develop'
            }
        }
        stage('Build Code'){
            steps{
                sh 'docker build . -t aviraln/django-app:latest'
            }
        }
        stage('Login and Push Image')
        {
            steps{
                withCredentials([usernamePassword(credentialsId:'dockerhub', passwordVariable:'dockerhubpass', usernameVariable:'dockerhubuser')]){
                    sh "docker login -u ${env.dockerhubuser} -p ${env.dockerhubpass}"
                    sh 'docker push aviraln/django-app:latest'
                }
            }
        }
        stage('Test Code'){
            steps{
                echo 'code tested'
            }
        }
        stage('Deploy Code'){
            steps{
                sh 'docker-compose down && docker-compose up -d'
            }
        }
        stage('Child Job'){
            steps{
                build job: "child-job-pipeline", wait: true            
            }
        }
    }
}
