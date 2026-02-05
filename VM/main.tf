###############################
# Alarmas Azure VM (iteración manual por VM)
###############################

# CPU %
resource "azurerm_monitor_metric_alert" "cpu_utilization" {
  for_each = local.selected_vms

  name                = "${local.alarm_name_base}-${replace(each.key, "/", "-")}-CPU"
  resource_group_name = var.resource_group_name
  scopes = [local.vm_resource_ids[each.key]]


  description = "Uso de CPU en la VM"
  severity    = 2
  enabled     = true

  frequency   = "PT${var.vm_cpu_events_period / 60}M"
  window_size = "PT${var.vm_cpu_events_period / 60}M"

  criteria {
    metric_namespace = "Microsoft.Compute/virtualMachines"
    metric_name      = "Percentage CPU"
    aggregation      = "Average"
    operator         = "GreaterThan"
    threshold        = var.vm_cpu_threshold
  }

  tags = local.merged_tags_common

  dynamic "action" {
    for_each = local.action_group_ids_effective
    content {
      action_group_id = action.value
    }
  }
}
