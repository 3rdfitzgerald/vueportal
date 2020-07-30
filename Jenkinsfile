// This file creates the Jenkins job that executes the terraform pipeline
// Do not edit this file!

// Load the Jenkins library
@Library('jenkins-ext') _

// Defines parameters for the pipeline
setParameters ([
	credentials(name: "service_principal", description: "your Azure service principal", required: true),
	string(name: 'env_name', description: '<team>.<project>.<environment>\nExample: devops.jenkins.test')
	//string(name: 'varfile', description: "The file containing your variable values")
])

if (!params.env_name)        { error 'env_name parameter not defined' }
//if (!params.varfile)        { error 'varfile parameter not defined' }

// Set necessary environment variables
withCredentials([string(credentialsId: 'sas_token_tfstate', variable: 'sas_token_tfstate'), azureServicePrincipal('${service_principal}')]) {
	setEnvironment TF_VAR_subscription_id: AZURE_SUBSCRIPTION_ID,
		TF_VAR_client_id: AZURE_CLIENT_ID, 
		TF_VAR_client_secret: AZURE_CLIENT_SECRET, 
		TF_VAR_tenant_id: AZURE_TENANT_ID,
		TF_VAR_env_name: params.env_name,
		TF_VAR_sas_token: sas_token_tfstate

	require 'terraform'
	initialize this

	kubepipe {
		// clone this repository
		stage('Checkout SCM') {
			checkout scm
		}
	
		// generate and publish a plan
		// on initialization, the backend 
		// for remote state storage is configured
		// once the plan is created, it is pretty
		// printed to an html file and published
		// so that it can be reviewed
		stage('Plan') {
			//def env_name = readFile(file: params.varfile).find(/env_name.*/).split("=")[1].trim().replaceAll("\"","").replaceAll("\'","")
			terraform "init -backend-config 'key=${TF_VAR_env_name}' \
						-backend-config 'sas_token=${TF_VAR_sas_token}'"
			terraform "plan -out=myplan"
			String specialCharRegex = /[\W_&&[^\s]]/

			def html = "<pre>${terraform('show -no-color myplan').replaceAll("${TF_VAR_client_id.replaceAll(/\[\d+m/,'').replaceAll(specialCharRegex,'\\\\$0')}", "*****").replaceAll("${TF_VAR_client_secret.replaceAll(specialCharRegex,'\\\\$0')}", "*****")}</pre>"
			writeFile file: 'index.html', text: html
			publishHTML (target: [
				allowMissing: false,
				alwaysLinkToLastBuild: false,
				keepAll: true,
				reportDir: '',
				reportFiles: 'index.html',
				reportName: "Plan"
			])
		}
	
		// prompts the user to view the plan
		// on user approval, applies the plan
		stage('Apply') {
			input "View your planned infrastucture:\n${BUILD_URL}Plan \n\n Do you want to Proceed? \n"
			terraform 'apply -auto-approve myplan'
		}
		
		// prompts the user to destroy the infrastructure
		// on approval, tears down anything managed 
		// by the linked state file
		stage('Destroy') {
			input 'Destroy now?'
			terraform 'destroy -auto-approve'
		}	
	}
}