
output "environment_ids" {
  value = {
    for k, v in azurerm_container_app_environment.env : k => v.id
  }
}

output "container_app_ids" {
  value = {
    for k, v in azurerm_container_app.apps : k => v.id
  }
}

output "container_app_fqdns" {
  value = {
    for k, v in azurerm_container_app.apps : k => v.latest_revision_fqdn
  }
}