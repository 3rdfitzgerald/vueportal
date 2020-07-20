# This file configures Terraform with the settngs necessary for the pipeline.
# *** Changing this file could break things ***

# This block lets terraform know you're deploying to azure
# It takes your service principal details to establish this connection
provider "azurerm" {
    version         = "1.44.0"
    client_id       = "${var.client_id}"
    client_secret   = "${var.client_secret}"
    tenant_id       = "${var.tenant_id}"
    subscription_id = "${var.subscription_id}"
}

# This block configures your remote state 
# Instead of producing a local state file, terraform connects to blob storage and saves it there
terraform {
   backend "azurerm" {
     resource_group_name  = "mna-use2-devops-tfstate"
     storage_account_name = "mnause2devopstfstate"
     container_name       = "tfstate"
     key                  = "${var.env_name}"
     sas_token            = "${var.sas_token}"
   }
}