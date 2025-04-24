pipeline {
    agent {
        label 'jenkins'
    }
    options { 
        disableConcurrentBuilds() 
        ansiColor('xterm')
        }


    parameters {
        
        choice(name: 'Action', choices: ['list', 'terraform init', 'terraform plan'], description: 'Pick something')

    }

    stages {
        stage('Build') {
            steps {
                echo 'Building..'
                sh """
                    ls -ltr

                """
            }
        }
        stage('init') {

            input {
                message "Should we continue?"
                ok "Yes, we should."
            }
            steps {
                echo 'initializing the terraform.......'
                when {
                     expression 
                     { 
                        return params.Action
                     } 
                    }
                sh """
                    terraform init -reconfigure
                """
            }
        }
        stage('plan') {

             input {
                message "Should we continue?"
                ok "Yes, we should."
            }
            steps {
                echo 'planning the terraform.........'
                    when {
                     expression 
                     { 
                        return params.Action
                     } 
                    }
                sh """
                    terraform plan

                """
            }
        }
    }
    post { 
        always { 
            echo 'I will always say Hello again!'
            //deleteDir()
        }
        failure{
            echo 'I will stages are failed'
        }
        success{
            echo 'I will run success '
        }
    }
}