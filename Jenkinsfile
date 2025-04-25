pipeline {
    agent {
        label 'jenkins'
    }
    options { 
        disableConcurrentBuilds() 
        ansiColor('xterm')
        }


    parameters {
        
        choice(name: 'Action', choices: ['list', 'init', 'plan'], description: 'Pick something')

    }

    stages {
        stage('list') {
            steps {
                echo 'Building..'
                sh """
                   cd 01-vpc
                    ls -ltr

                """
            }
        }
        stage('init') {

            when {
                     expression 
                     { 
                         params.Action == 'init'
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

            when {
                     expression 
                     { 
                        params.Action == 'plan'
                     } 
                    }
            steps {
                echo 'planning the terraform.........'
                    
                sh """
                   cd 01-vpc
                    terraform apply --auto -approve

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