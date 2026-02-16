resource "azurerm_static_site" "example" {
  name                = var.app_name
  resource_group_name = var.resource_group_name
  location            = var.location
  sku_tier                 = var.sku_name
  sku_size = var.sku_size

  tags = var.tags

}