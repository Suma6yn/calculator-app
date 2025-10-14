pipeline {
    agent { label 'Node_16' }

    environment {
        IMAGE_NAME = "cal_maven"
        IMAGE_TAG = "latest"
    }

    stages {
        stage('Checkout') {
            steps {
                // Pull code from GitHub
                git url: 'https://github.com/Suma6yn/calculator-app.git', branch: 'master'
            }
        }
        stage('Build Docker Image') {
            steps {
                script {
                    sh "docker build -t ${IMAGE_NAME}:${IMAGE_TAG} ."
                }
            }
        }

        stage('Test Docker Image') {
            steps {
                script {
                    // Run container to test calculator
                    sh "docker run --rm ${IMAGE_NAME}:${IMAGE_TAG}"
                }
            }
        }
    }
}
