pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'pass-wali-dukan'
    }

    stages {
        stage('Build') {
            steps {
                script {
                    def branchName = env.BRANCH_NAME.replaceAll('/', '-') // Sanitize branch name
                    def commitHash = sh(script: "git rev-parse --short HEAD", returnStdout: true).trim()
                    def imageTagCommit = "${DOCKER_IMAGE}:${branchName}-${commitHash}"

                    docker.withRegistry("http://${env.K8S_CONTAINER_REGISTRY}") {
                        docker.build(imageTagCommit)
                        docker.image(imageTagCommit).push()
                    }
                    
                    env.IMAGE_TAG_COMMIT = imageTagCommit
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    def deploymentFile = (env.BRANCH_NAME == 'master') ? 'k8s/deploy-master.yaml' : 'k8s/deploy-dev.yaml'
                    withKubeConfig([credentialsId: env.K8S_CONFIG]){
                        sh """
                            sed -i 's|<REPLACE_PWD_IMAGE>|${env.K8S_CONTAINER_REGISTRY}/${IMAGE_TAG_COMMIT}|g' ${deploymentFile}
                            cat ${deploymentFile}
                            kubectl apply -f ${deploymentFile}
                        """
                    }
                }
            }
        }
    }
}