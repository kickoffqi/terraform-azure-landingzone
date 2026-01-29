variable "location" {
  type        = string
  description = "Azure Region"
}

variable "network_resource_group_name" {
  type = string
}

variable "monitoring_resource_group_name" {
  type = string
}

variable "aks_resource_group_name" {
  type = string
}

variable "aks_cluster_name" {
  type = string
}

variable "aks_dns_prefix" {
  type        = string
  description = "DNS prefix for the AKS cluster"
  default     = "aks-lz-cluster"

}

variable "vm_size" {
  type    = string
  default = "standard_D2S_v3"

}
variable "enable_auto_scaling" {
  type    = bool
  default = true
}
variable "min_count" {
  type    = number
  default = 2
}

variable "max_count" {
  type    = number
  default = 5
}

variable "monitoring_workspace_name" {
  type        = string
  description = "The name of the Log Analytics Workspace"
  default     = "law-lz-cluster"

}

variable "monitoring_retention_in_days" {
  type    = number
  default = 30
}

variable "network_vnet_name" {
  type = string
}

variable "network_subnets" {
  type = map(string)
}

variable "network_plugin" {
  type    = string
  default = "azure"
}

variable "load_balancer_sku" {
  type    = string
  default = "standard"
}

variable "service_cidr" {
  type    = string
  default = "172.16.0.0/16"
}

variable "dns_service_ip" {
  type    = string
  default = "172.16.0.10"
}

variable "local_account_disabled" {
  type        = bool
  description = "Disable local accounts for enhanced security."
  default     = true
}

variable "authorized_ip_ranges" {
  type        = list(string)
  description = "List of authorized IP ranges for API server access."
  default     = ["0.0.0.0/0"]
}
