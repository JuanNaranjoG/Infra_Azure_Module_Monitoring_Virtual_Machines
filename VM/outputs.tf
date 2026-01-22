###############################
# Outputs
###############################

output "cpu_alarms" {
  description = "IDs de las alarmas de CPU por VM"
  value       = values(azurerm_monitor_metric_alert.cpu_utilization)[*].id
}

output "memory_alarms" {
  description = "IDs de las alarmas de uso de memoria por VM"
  value       = values(azurerm_monitor_metric_alert.memory_utilization)[*].id
}

output "disk_alarms" {
  description = "IDs de las alarmas de uso de disco por VM"
  value       = values(azurerm_monitor_metric_alert.disk_utilization)[*].id
}
