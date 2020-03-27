#!groovy

node {

    properties([disableConcurrentBuilds()])

    try {
        stage("Pull Source") {
        //trying to get the hash without checkout gets the hash set in previous build.
            def checkout = checkout scm
            env.COMMIT_HASH = checkout.GIT_COMMIT
            echo "Checkout done; Hash: '${env.COMMIT_HASH}'"
        }

        stage("Run ansible"){
            // Run ansible to create resource groups
            sh "ansible-playbook ansible/nsgautomation/updateSecurityRules.yaml --vault-password-file ansible_vault -e 'ansible_python_interpreter=/usr/bin/python3'"
        }

    } catch (e) {
        throw e
    } finally {
        cleanWs()
        echo "Build done."
    }
}