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

variable "kubernetes_version" {
  type    = string
  default = "1.33"
}

variable "automatic_channel_upgrade" {
  type    = string
  default = "patch"
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
  default = 1
}

variable "max_count" {
  type    = number
  default = 1
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

variable "network_nsg_inbound_rules" {
  description = "Inbound NSG rules applied to the VNet subnets."
  type = list(object({
    name                       = string
    priority                   = number
    direction                  = string
    access                     = string
    protocol                   = string
    source_port_range          = string
    destination_port_ranges    = list(string)
    source_address_prefix      = string
    destination_address_prefix = string
  }))
  default = [
    {
      name                       = "Allow-AzureLoadBalancer-NodePorts"
      priority                   = 100
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = ["30000-32767"]
      source_address_prefix      = "AzureLoadBalancer"
      destination_address_prefix = "*"
    },
    {
      name                       = "Allow-Internet-HTTP-HTTPS"
      priority                   = 110
      direction                  = "Inbound"
      access                     = "Allow"
      protocol                   = "Tcp"
      source_port_range          = "*"
      destination_port_ranges    = ["80", "443"]
      source_address_prefix      = "Internet"
      destination_address_prefix = "*"
    }
  ]
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

variable "work_node_count" {
  description = "The number of nodes in the working (user) node pool."
  type        = number
  default     = 1
}

variable "work_node_vm_size" {
  description = "VM size for the working (user) node pool."
  type        = string
  default     = "standard_D2S_v3"
}

variable "work_enable_auto_scaling" {
  description = "Enable or disable autoscaling for the working (user) node pool."
  type        = bool
  default     = true
}

variable "work_min_count" {
  description = "Minimum number of nodes for the working (user) node pool."
  type        = number
  default     = 1
}

variable "work_max_count" {
  description = "Maximum number of nodes for the working (user) node pool."
  type        = number
  default     = 2
}
