variable "resource_group_name" {
  description = "The name of the resource group where monitoring resources will be created."
  type        = string
}

variable "location" {
  description = "The location where monitoring resources will be created."
  type        = string
}

variable "workspace_name" {
  description = "The name of the Log Analytics Workspace."
  type        = string
}

variable "sku" {
  description = "The SKU of the Log Analytics Workspace."
  type        = string
  default     = "PerGB2018"
}

variable "retention_in_days" {
  description = "The retention period for the Log Analytics Workspace in days."
  type        = number
  default     = 30
}




