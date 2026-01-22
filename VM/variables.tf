###############################
# Variables generales (modo manual)
###############################

# Lista manual de nombres de VMs a monitorear
variable "vm_names" {
  description = "Lista de nombres de máquinas virtuales a monitorear"
  type        = list(string)
}

variable "project" {
  description = "Nombre del proyecto"
  type        = string
}

variable "bdo_name_service" {
  description = "Nombre del servicio BDO"
  type        = string
}

variable "bdo_environment" {
  description = "Entorno (dev, staging, prod)"
  type        = string
}

# Azure Monitor usa Action Groups
variable "action_group_ids" {
  description = "Lista de IDs de Action Groups para las alertas"
  type        = list(string)
  default     = []
}

# Fallback opcional si no pasas action_group_ids
variable "default_action_group_id" {
  description = "Action Group ID por defecto (opcional, se usa como fallback)"
  type        = string
  default     = null
}


variable "resource_group_name" {
  description = "Resource Group donde se crean las alertas y existen las VMs"
  type        = string
}

variable "resource_tags" {
  description = "Etiquetas Bdo - Etiquetas Aval"
  type        = map(string)
  default     = {}
}

variable "resource_adicional_tags" {
  description = "Etiquetas adicionales no obligatorias"
  type        = map(string)
  default     = {}
}

###############################
# Variables por métrica (umbrales comunes)
###############################

## CPU
variable "vm_cpu_evaluation_periods" {
  description = "Número de períodos a evaluar para la CPU"
  type        = number
  default     = 2
}

variable "vm_cpu_events_period" {
  description = "Periodo (en segundos) para la métrica de CPU"
  type        = number
  default     = 300
}

variable "vm_cpu_threshold" {
  description = "Umbral de CPU (%) para alarmas"
  type        = number
  default     = 80
}

## Memory (requiere Azure Monitor Agent)
variable "vm_memory_evaluation_periods" {
  description = "Número de períodos a evaluar para la memoria"
  type        = number
  default     = 2
}

variable "vm_memory_events_period" {
  description = "Periodo (en segundos) para la métrica de memoria"
  type        = number
  default     = 300
}

variable "vm_memory_threshold" {
  description = "Umbral mínimo de memoria disponible (%)"
  type        = number
  default     = 15
}

## Disk space
variable "vm_disk_evaluation_periods" {
  description = "Número de períodos a evaluar para espacio en disco"
  type        = number
  default     = 1
}

variable "vm_disk_events_period" {
  description = "Periodo (en segundos) para la métrica de disco"
  type        = number
  default     = 300
}

variable "vm_disk_threshold" {
  description = "Porcentaje mínimo de espacio libre en disco"
  type        = number
  default     = 10
}

## VM availability
variable "vm_availability_evaluation_periods" {
  description = "Número de períodos a evaluar para disponibilidad de la VM"
  type        = number
  default     = 1
}

variable "vm_availability_events_period" {
  description = "Periodo (en segundos) para verificar disponibilidad"
  type        = number
  default     = 300
}

variable "vm_availability_threshold" {
  description = "Umbral de disponibilidad (1 = VM disponible)"
  type        = number
  default     = 1
}
