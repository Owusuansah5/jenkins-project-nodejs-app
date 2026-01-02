
pipeline { 
    agent any
    
        // docker { 
        //     image 'node:20-bullseye'
        //     args '-u root:root -v /var/run/docker.sock:/var/run/docker.sock'

        // }
        
    
             
    tools {
        nodejs 'node'
    }

    stages {
        stage('increment version') {
            steps {
                script {
                    
                    dir("app") {
                    
                        sh "npm version minor --no-git-tag-version"

                        def packageJson = readJSON file: 'package.json'
                        def version = packageJson.version

                        env.IMAGE_NAME = "$version-$BUILD_NUMBER"
                    }

                    /* alternative solution without Pipeline Utility Steps plugin: 
                    # def version = sh (returnStdout: true, script: "grep 'version' package.json | cut -d '\"' -f4 | tr '\\n' '\\0'")
                    # env.IMAGE_NAME = "$version-$BUILD_NUMBER"*/
                }
            }
        }
        
        stage('Run tests') {
            steps {
                script {
                    dir("app") {
                        sh "npm install"
                        sh "npm audit fix --force"
                        sh "npm run test"
                    }
                }
            }
        }
        stage('Build and Push docker image') {
            
            steps {
                withCredentials([usernamePassword(credentialsId: 'docker-login-cred', usernameVariable: 'USER', passwordVariable: 'PASS')]){
                    
                    sh "docker build -t owusuansah5/myapp:${IMAGE_NAME} ."
                    sh 'echo $PASS | docker login -u $USER --password-stdin'
                    sh "docker push owusuansah5/myapp:${IMAGE_NAME}"
                }
                
            }
        }

    }
}


