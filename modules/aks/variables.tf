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

variable "network_plugin" {
  description = "The network plugin to use for the AKS cluster."
  type        = string
  default     = "azure"
}

variable "load_balancer_sku" {
  description = "The SKU of the load balancer."
  type        = string
  default     = "standard"
}

variable "service_cidr" {
  description = "The CIDR notation IP range from which to assign service cluster IPs."
  type        = string
  default     = "172.16.0.0/16"
}

variable "dns_service_ip" {
  description = "The IP address assigned to the DNS service."
  type        = string
  default     = "172.16.0.10"
}

variable "min_count" {
  description = "The minimum number of nodes in the AKS cluster."
  type        = number
  default     = 2
}

variable "max_count" {
  description = "The maximum number of nodes in the AKS cluster."
  type        = number
  default     = 5
}

variable "network_policy" {
  type    = string
  default = "azure"
}
