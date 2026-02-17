output "default_host_name" {
  value       = azurerm_static_web_app.example.default_host_name
  description = "Default hostname of the static web app"
}

output "static_site_url" {
  value       = "https://${azurerm_static_web_app.example.default_host_name}"
  description = "Full URL of the static web app"
}

output "static_site_id" {
  value       = azurerm_static_web_app.example.id
  description = "Resource ID of the static web app"
}

output "api_key" {
  value       = azurerm_static_web_app.example.api_key
  description = "API key for deploying to the static web app"
  sensitive   = true
}
