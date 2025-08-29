pipeline {
    agent any

    environment {
        TF_WORKING_DIR = '.'   
        PLAN_FILE = 'tfplan.binary'
    }

    stages {
        stage('Checkout Code') {
            steps {
                checkout scm
            }
        }

        stage('Setup AWS Credentials') {
            steps {
                withCredentials([usernamePassword(
                    credentialsId: 'aws-creds',
                    usernameVariable: 'AWS_ACCESS_KEY_ID',
                    passwordVariable: 'AWS_SECRET_ACCESS_KEY'
                )]) {
                    sh 'echo "AWS credentials injected for Terraform"'
                }
            }
        }

        stage('Terraform Init') {
            steps {
                dir("${TF_WORKING_DIR}") {
                    sh 'terraform init -input=false'
                }
            }
        }

        stage('Terraform Validate') {
            steps {
                dir("${TF_WORKING_DIR}") {
                    sh 'terraform validate'
                }
            }
        }

        stage('Terraform Plan') {
            steps {
                dir("${TF_WORKING_DIR}") {
                    sh "terraform plan -out=${PLAN_FILE}"
                    sh "terraform show -no-color ${PLAN_FILE} > plan.txt"
                }
            }
            post {
                always {
                    archiveArtifacts artifacts: "${TF_WORKING_DIR}/plan.txt", fingerprint: true
                }
            }
        }

    

        stage('Terraform Apply') {
            steps {
                dir("${TF_WORKING_DIR}") {
                    sh "terraform apply -input=false ${PLAN_FILE}"
                }
            }
        }
    }

    post {
        success {
            echo ' Terraform provisioning completed successfully!'
        }
        failure {
            echo ' Terraform provisioning failed.'
        }
    }
}
