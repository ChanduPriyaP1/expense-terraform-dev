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

            // input {
            //     message "Should we continue?"
            //     ok "Yes, we should."
            // }
            when {
                     expression 
                     { 
                         params.Action == 'terraform init'
                     } 
                    }
            steps {
                echo 'initializing the terraform.......'
                
                sh """
                    cd 01-vpc
                    terraform init -reconfigure
                """
            }
        }
        stage('plan') {

            //  input {
            //     message "Should we continue?"
            //     ok "Yes, we should."
            // }
            when {
                     expression 
                     { 
                        params.Action == 'terraform plan'
                     } 
                    }
            steps {
                echo 'planning the terraform.........'
                    
                sh """
                   cd 01-vpc
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