output "default_host_name" {
  value = azurerm_static_site.this.default_host_name
}
output "static_site_url" {
  value = azurerm_static_site.example.default_host_name
}

output "static_site_id" {
  value = azurerm_static_site.example.id
}

