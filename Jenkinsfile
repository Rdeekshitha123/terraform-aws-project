pipeline {
    agent any
    environment {
        AWS_CREDS = credentials('aws-jenkins-creds')
    }
    stages {
        stage('Terraform Init') {
    steps {
        sh 'terraform init -input=false -no-color -upgrade'
    }
}
        stage('Terraform Plan') {
            steps {
                sh 'terraform plan'
            }
        }
        stage('Terraform Apply') {
            steps {
                sh 'terraform apply -auto-approve'
            }
        }
    }
}

