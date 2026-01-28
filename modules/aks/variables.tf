variable "resource_group_name" {
  description = "The name of the resource group where AKS resources will be created."
  type        = string
}

variable "location" {
  description = "The location where AKS resources will be created."
  type        = string
}

variable "cluster_name" {
  description = "The name of the AKS cluster."
  type        = string
}

variable "dns_prefix" {
  description = "The DNS prefix for the AKS cluster."
  type        = string
}

variable "vnet_subnet_id" {
  description = "The ID of the subnet in which to deploy the AKS cluster."
  type        = string
}

variable "log_analytics_workspace_id" {
  description = "The ID of the Log Analytics workspace for monitoring."
  type        = string
}

variable "node_count" {
  description = "The number of nodes in the AKS cluster."
  type        = number
  default     = 2
}

variable "vm_size" {
  type    = string
  default = "standard_D2S_v3"
}
