# 📊 Módulo de Monitoreo para Máquinas Virtuales en Azure

Este módulo de Terraform permite configurar alertas de monitoreo en Azure Monitor para Máquinas Virtuales (VMs). Las alertas supervisan uso de CPU, uso de memoria y uso de disco, permitiendo detección temprana de problemas y acción preventiva.

## Requisitos

| Herramienta      | Versión mínima |
| ---------------- | -------------- |
| Terraform        | >= 1.0         |
| AzureRM Provider | ~> 3.0         |

## Archivos principales

- main.tf: Configuración de alertas de Azure Monitor.
- output.tf: Variables de salida del módulo.
- variables.tf: Variables para personalización (nombres, umbrales, etc).

## Configuración detallada

### Alarmas configuradas:

- CPUUtilization – Porcentaje de uso de CPU en la máquina virtual:
resource azurerm_monitor_metric_alert cpu_usage { ... }

- MemoryUtilization – Porcentaje de uso de memoria en la máquina virtual:
resource azurerm_monitor_metric_alert memory_usage { ... }

- DiskUtilization – Porcentaje de uso de disco en la máquina virtual:
resource azurerm_monitor_metric_alert disk_usage { ... }

Los threshold vienen por defecto y estos valores son los que se encuentran en el documento de lineamientos de monitoreo.

## Parámetros de las variables threshold

| Variable           | Valor     |
| ------------------ | --------- |
| cpu_window_size    | 5 minutos |
| cpu_frequency      | 1 minuto  |
| cpu_threshold      | 80 (%)    |
| memory_window_size | 5 minutos |
| memory_frequency   | 1 minuto  |
| memory_threshold   | 75 (%)    |
| disk_window_size   | 5 minutos |
| disk_frequency     | 1 minuto  |
| disk_threshold     | 85 (%)    |

## Parámetros configurables

| Parámetro            | Descripción                                |
| -------------------- | ------------------------------------------ |
| project              | Nombre del proyecto.                       |
| bdo_name_service     | Nombre del servicio.                       |
| bdo_environment      | Entorno (dev, qa, prod).                   |
| resource_group_name  | Resource Group donde se crean las alertas. |
| vm_ids               | Lista de IDs de las máquinas virtuales.    |
| alarm_actions        | Action Groups para estado de alarma.       |
| ok_actions           | Action Groups para estado OK.              |
| tags                 | Etiquetas del banco.                       |

## Modo de uso

module vm_monitoring { source = git::https://github.com/tu-org/Infra_Azure_Module_Monitoring_VM.git//vm?ref=main project = var.project bdo_name_service = var.bdo_name_service bdo_environment = var.bdo_environment resource_group_name = var.resource_group_name vm_ids = var.vm_ids }

## Resource

https://learn.microsoft.com/azure/azure-monitor/metrics/metrics-supported

Infra_Azure_Module_Monitoring_VM


# Infra_AWS_Module_Monitoring_Virtual_Machines
