pipeline {

  agent any

  stages {

    stage('Clone Repo') {
      steps {
        git 'https://github.com/chaitramk23/eks-terraform-ansible.git' 
      }
    }

    stage('Terraform Init') {
      steps {
        dir('terraform') {
          sh 'terraform init'
        }
      }
    }

    stage('Terraform Plan') {
      steps {
        dir('terraform') {
          sh 'terraform plan'
        }
      }
    }

    stage('Terraform Apply') {
      steps {
        dir('terraform') {
          sh 'terraform apply -auto-approve'
        }
      }
    }

    stage('Run Ansible') {
      steps {
        dir('ansible') {
          sh 'ansible-playbook -i inventory/aws_ec2.yml playbook.yml'
        }
      }
    }

    stage('Deploy Helm') {
      steps {
        dir('helm/simple-app') {
          sh 'helm install nginx-app .'
        }
      }
    }

  }
}
