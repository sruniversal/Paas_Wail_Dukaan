pipeline {
    agent any

    environment {
        DOCKER_IMAGE = 'mangesh32/pass-wali-dukan'
        DOCKER_CREDENTIALS_ID = 'container-registry-creds'
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
                    docker.build(imageTag).tag(imageTagCommit)
                    
                    // Store image tags for later use
                    env.IMAGE_TAG = imageTag
                    env.IMAGE_TAG_COMMIT = imageTagCommit
                }
            }
        }

        stage('Push Image') {
            steps {
                script {
                    docker.withRegistry('', DOCKER_CREDENTIALS_ID) {
                        docker.image(env.IMAGE_TAG).push()
                        docker.image(env.IMAGE_TAG_COMMIT).push()
                    }
                }
            }
        }

        stage('Deploy') {
            steps {
                script {
                    def deploymentFile = (env.BRANCH_NAME == 'master') ? 'k8s/deploy-master.yaml' : 'k8s/deploy-dev.yaml'
                    kubernetesDeploy(
                        configs: [deploymentFile]
                    )
                }
            }
        }
    }
}