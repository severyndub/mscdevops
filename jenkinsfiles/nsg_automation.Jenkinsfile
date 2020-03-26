#!groovy

node {

    properties([disableConcurrentBuilds()])

    String targetEnv = ""

    try {
        targetEnv = params.TARGET_ENV?.trim()

        echo """Parameters:
            targetEnv: '${targetEnv}'
            """

        stage("Pull Source") {
        //trying to get the hash without checkout gets the hash set in previous build.
            def checkout = checkout scm
            env.COMMIT_HASH = checkout.GIT_COMMIT
            echo "Checkout done; Hash: '${env.COMMIT_HASH}'"
        }

        stage("Run ansible"){

            // Run ansible to create resource groups
            sh "sudo ansible-playbook ansible/nsgautomation/updateSecurityRules.yaml --extra-vars env=${targetEnv} --vault-password-file ansible_vault -e 'ansible_python_interpreter=/usr/bin/python3'"
        }

    } catch (e) {
        throw e
    } finally {
        cleanWs()
        echo "Build done."
    }
}