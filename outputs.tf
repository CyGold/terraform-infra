output "static_web_app_url" {
  value       = module.static_web_app.static_site_url
  description = "URL of the deployed static web app"
}

output "static_web_app_hostname" {
  value       = module.static_web_app.default_host_name
  description = "Hostname of the static web app"
}

output "static_web_app_id" {
  value       = module.static_web_app.static_site_id
  description = "Resource ID of the static web app"
}

output "deployment_token" {
  value       = module.static_web_app.api_key
  description = "Deployment token for GitHub Actions or Azure Pipelines"
  sensitive   = true
}
