locals {
  # Base del nombre para todas las alarmas
  alarm_name_base = "${var.project}-${var.bdo_name_service}-${var.bdo_environment}"

  # Tags comunes + adicionales
  merged_tags_common = merge(
    {
      name = local.alarm_name_base
    },
    var.resource_tags,
    var.resource_adicional_tags
  )

  # Action Groups efectivos con fallback
  action_group_ids_effective = (
    length(var.action_group_ids) > 0
    ? var.action_group_ids
    : (var.default_action_group_id != null ? [var.default_action_group_id] : [])
  )

  # Set de VMs seleccionadas (manual)
  selected_vms = toset(var.vm_names)
}
