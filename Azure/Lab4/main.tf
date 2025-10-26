resource "azurerm_resource_group" "main" {
  name = "rg-${var.application_name}-${var.environment_name}"
  location = var.primary_location
}
resource "random_string" "keyvault_suffix" {
    length = 6
    upper = false
    lower = false
    special = false
}

data "azurerm_client_config" "current" {} #imp

resource "azurerm_key_vault" "main" {
  name                        = "kv-${var.application_name}-${var.environment_name}-${random_string.keyvault_suffix.result}"
  location                    = azurerm_resource_group.main.location
  resource_group_name         = azurerm_resource_group.main.name
  tenant_id                   = data.azurerm_client_config.current.tenant_id
  sku_name = "standard"
}

resource "azurerm_role_assignment" "terraform_user" {
  scope                = azurerm_key_vault.main.id
  role_definition_name = "Key Vault Administrator"
  principal_id         = data.azurerm_client_config.current.object_id
}
