pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'mangesh32/pass-wali-dukan'
    }

    stages {
        stage('Build') {
            steps {
                script {
                    def branchName = env.BRANCH_NAME.replaceAll('/', '-') // Sanitize branch name
                    def commitHash = sh(script: "git rev-parse --short HEAD", returnStdout: true).trim()

                    def imageTag = "${DOCKER_IMAGE}:${branchName}"
                    def imageTagCommit = "${DOCKER_IMAGE}:${branchName}-${commitHash}"

                    // Use Docker Pipeline Plugin for building and tagging
                    docker.build(imageTagCommit)
                    
                    // Store image tags for later use
                    env.IMAGE_TAG_COMMIT = imageTagCommit
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    def deploymentFile = (env.BRANCH_NAME == 'master') ? 'k8s/deploy-master.yaml' : 'k8s/deploy-dev.yaml'
                	withKubeConfig([credentialsId: 'jenkins-kubeconfig']) {
                        sh """
                            sed -i 's|<REPLACE_PWD_IMAGE>|docker.io/${DOCKER_IMAGE}:${IMAGE_TAG_COMMIT}|g' ${deploymentFile}
                            cat ${deploymentFile}
                            kubectl apply -f ${deploymentFile}
                        """
                    }
                }
            }
        }
    }
}