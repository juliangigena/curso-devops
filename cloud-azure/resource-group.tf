resource "azurerm_resource_group" "devops-rg" {
  name     = "devops-resources-${var.proyecto}"
  location = local.location
  tags     = local.tags
}