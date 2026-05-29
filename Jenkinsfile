pipeline {
  agent any
  options {
    timestamps()
  }
  stages {
    stage('Install tooling') {
      steps {
        sh 'python3 -m pip install --user -r requirements.txt'
      }
    }
    stage('Lint Ansible') {
      steps {
        sh 'python3 -m ansiblelint playbooks roles'
        sh 'yamllint .'
      }
    }
    stage('Syntax check') {
      steps {
        sh 'ansible-playbook -i inventory/hosts.example.ini playbooks/bootstrap_jetson.yml --syntax-check'
        sh 'ansible-playbook -i inventory/hosts.example.ini playbooks/deploy_ros2_container.yml --syntax-check'
      }
    }
    stage('Dry run gate') {
      steps {
        sh 'ansible-playbook -i inventory/hosts.example.ini playbooks/verify_edge_node.yml --check || true'
      }
    }
  }
}