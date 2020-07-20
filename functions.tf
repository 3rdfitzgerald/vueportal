# This is an example to help get you started
# Running this example performs the following:
# - Creates a resource group
# - Assigns permissions to the resource group

# Ensure that all of your resource names follow the published naming guidelines:
# https://confluence.markelcorp.com/display/ENTCLDMIG/Azure+Naming+Guideline

# For syntax guidelines, refer to the Terraform Azure Provider documentation:
# https://www.terraform.io/docs/providers/azurerm/

// az login
/*
resource "null_resource" "az-login-service-principal" {
  provisioner "local-exec" {
    command           = "az login --service-principal -u ${var.client_id} -p ${var.client_secret} -t ${var.tenant_id}; az account set -s ${var.subscription_id}"
    //interpreter       = ["PowerShell", "-Command"]
  }
}


resource "null_resource" "az-login-account-set" {
  provisioner "local-exec" {
    command           = "az account set -s ${var.subscription_id}"
    //interpreter       = ["PowerShell", "-Command"]
  }
}

resource "null_resource" "az-login-account-set" {
  provisioner "local-exec" {
    command           = "az account set --subscription mna-dev-dataservices"
    //interpreter       = ["PowerShell", "-Command"]
  }
}

*/

// Here goes the Resource group creation

resource "azurerm_resource_group" "rg-testDeployTF" {
name = "functestrg345"
location = "eastus2"

tags = {
    ProjectCode                                          = 50220
}
}

resource "azurerm_application_insights" "test" {
  name                = "tf-test-appinsightsCopy"
  location            = azurerm_resource_group.rg-testDeployTF.location
  resource_group_name = azurerm_resource_group.rg-testDeployTF.name
  application_type    = "web"
}
/*
output "instrumentation_key" {
  value = azurerm_application_insights.test.instrumentation_key
}

output "app_id" {
  value = azurerm_application_insights.test.app_id
}
*/

// Here goes the storage account creation


resource "azurerm_storage_account" "sa-testDeployTF" {
    name                     = "functeststorageacc345"
    resource_group_name      = azurerm_resource_group.rg-testDeployTF.name
    location                 = azurerm_resource_group.rg-testDeployTF.location
    account_tier             = "Standard"
    account_replication_type = "LRS"
}

// Here goes the storage container creation


resource "azurerm_storage_container" "sc-testDeployTF" {
    name                  = "functestcontainer356"
    resource_group_name   = azurerm_resource_group.rg-testDeployTF.name
    storage_account_name  = azurerm_storage_account.sa-testDeployTF.name
    container_access_type = "private"
}

// Here goes the storage blob creation


resource "azurerm_storage_blob" "sb-testDeployTF" {
    name = "TableRowDelete.zip"
    resource_group_name    = azurerm_resource_group.rg-testDeployTF.name
    storage_account_name   = azurerm_storage_account.sa-testDeployTF.name
    storage_container_name = azurerm_storage_container.sc-testDeployTF.name
    type   = "block"
    source = "./TableRowDelete.zip"
}

// Here goes the azure storage account sas creation


data "azurerm_storage_account_sas" "sas-testDeployTF" {
    connection_string = azurerm_storage_account.sa-testDeployTF.primary_connection_string
    https_only        = true
    resource_types {
        service   = true
        container = true
        object    = true
    }
    services {
        blob  = true
        queue = true
        table = true
        file  = true
    }
    start  = "2020-02-21"
    expiry = "2020-05-21"
    permissions {
        read    = true
        write   = true
        delete  = true
        list    = true
        add     = true
        create  = true
        update  = true
        process = true
    }
}


// Here goes the app service plan creation

resource "azurerm_app_service_plan" "app-testDeployTF" {
    name                = "functestappserviceplan356"
    location            = azurerm_resource_group.rg-testDeployTF.location
    resource_group_name = azurerm_resource_group.rg-testDeployTF.name
    kind                = "Linux"
    reserved            = true

    sku {
        tier = "Premium"
        size = "P2V2"
    }
}

// Here goes the function app creation


resource "azurerm_function_app" "app-testDeployTF" {
    name                      = "functestapp356"
    location                  = azurerm_resource_group.rg-testDeployTF.location
    resource_group_name       = azurerm_resource_group.rg-testDeployTF.name
    app_service_plan_id       = azurerm_app_service_plan.app-testDeployTF.id
    storage_connection_string = azurerm_storage_account.sa-testDeployTF.primary_connection_string
    https_only                = true
    version                   = "~2"
    
    site_config {
        always_on         = true
        linux_fx_version = "DOCKER|mcr.microsoft.com/azure-functions/python:2.0-python3.7-appservice"
            cors { 
      //allowed_origins = ["https://www.${var.domain_name}"]
      allowed_origins = ["https://functions.azure.com", "https://functions-staging.azure.com", "https://functions-next.azure.com"]
    }
    }
    app_settings = {
    FUNCTIONS_WORKER_RUNTIME = "python"
    ENABLE_ORYX_BUILD=true
    SCM_DO_BUILD_DURING_DEPLOYMENT=true
    https_only = true
    APPINSIGHTS_INSTRUMENTATIONKEY = azurerm_application_insights.test.instrumentation_key
     WEBSITE_USE_ZIP = "https://${azurerm_storage_account.sa-testDeployTF.name}.blob.core.windows.net/${azurerm_storage_container.sc-testDeployTF.name}/${azurerm_storage_blob.sb-testDeployTF.name}${data.azurerm_storage_account_sas.sas-testDeployTF.sas}"
    }
}


 resource "null_resource" "function_app_zip" {
provisioner "local-exec" {
    command = "az login --service-principal -u ${var.client_id} -p ${var.client_secret} -t ${var.tenant_id}; az account set -s ${var.subscription_id}; az functionapp deployment source config-zip -g ${azurerm_resource_group.rg-testDeployTF.name} -n functestapp356 --src ./TableRowDelete.zip"
    //interpreter       = ["PowerShell", "-Command"]
  }
  //depends_on                                          = [null_resource.az-login-service-principal]
 }

# This assigns RBAC (role-based-access-control) permissions to the resource group
# In this example the "principal_id" value matches the AD group "RG DevOps Users"
# https://www.terraform.io/docs/providers/azurerm/r/role_assignment.html
/*
resource "azurerm_role_assignment" "mna-use2-test-rg-sampleresourcegroup-01" {
  scope                = "/subscriptions/${var.subscription_id}/resourceGroups/mna-use2-test-rg-sampleresourcegroup-01"
  role_definition_name = "Contributor"
  principal_id         = "ca7eb5cf-b5e9-46eb-ac76-f5b22867209f"
  depends_on           = [azurerm_resource_group.mna-use2-test-rg-sampleresourcegroup-01]
}*/