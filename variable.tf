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
