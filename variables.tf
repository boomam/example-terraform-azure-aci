variable "resource_group_name" {
  default = "my-resource-group"
  description = "Name of the resource group to put resources into"
}

variable "location" {
  default = "eastus"
  description = "What location to place resources/groups into. For example, "eastus" or "centralus""
}

variable "environment" {
  default = "non-prod-testing"
  description = "Environment name. For example, "non-prod" or "prod""
}

variable "tags" {
  description = "Tag metadata to add to resources"
}

# Container Group Information
variable "container_group_name" {
  default = "my-container-group"
  description = "Name of the container group"
}

variable "ip_address_type" {
  default = "Public"
  description = "Type of IP address to use. For example, "Public" or "Private""
}

variable "dns_name_label" {
  default = "my-dns-name"
  description = "The DNS name for the container groups external IP"
}

variable "os_type" {
  default = "Linux"
  description = "The OS of the containers within the group. For example, "Linux" or "Windows""
}

# Storage Information
variable "storage_account_name" {
  default = "storageaccount1"
  description = "A globally unique storage account name. Requirements are under 24 characters."
}

variable "storage_account_kind" {
  default = "StorageV2"
  description = "Storage Account Kind, either v1 or v2"
}

variable "storage_account_tier" {
  default = "Standard"
  description = "Storage Account Tier. For example, "Standard" or "Premium""
}

variable "storage_account_replication" {
  default = "LRS"
  description = "Replication type. For example, "LRS", "GRS", etc"
}

variable "storage_account_share_name" {
  default = "my-nginx-share"
  description = "Name of the share used by the nginx container for persistant storage"
}

variable "storage_account_share_quota" {
  default = "5"
  description = "Quota size for file share, in Gb"
}

variable "storage_account_key" {
  default = "abc123"
  description = "SAS key for storage access"
}

variable "storage_account_access_tier" {
  default = "Hot"
  description = "Default access tier for storage account. Either "hot" or "cold""
}

variable "storage_account_tls_version" {
  default = "TLS1_2"
  description = "Minimum TLS version"
}

variable "storage_account_public_networking" {
  default = "disabled"
  description = "Enable/disable public networking on storage account"
}

variable "storage_account_https_traffic_only" {
  default = "true"
  description = "HTTPS traffic only, true/false"
}

variable "storage_account_shared_access_key_enabled" {
  default = "true"
  description = "Enable/disable SAS, true/false"
}

# Container Information
variable "container_name" {
  default = "my-nginx-container"
  description = "The name of the container"
}

variable "container_image" {
  default = "nginx"
  description = "What image to use for the container"
}

variable "container_cpu" {
  default = "1"
  description = "Number of CPU cores to give the container"
}

variable "container_mem" {
  default = "1"
  description = "Amount of memory to give the container, in Gb"
}

variable "container_port_http" {
  default = "80"
  description = "What port to use for HTTP"
}

variable "container_port_protocol_http" {
  default = "TCP"
  description = "What protocol to use for HTTP"
}

variable "container_port_https" {
  default = "443"
  description = "What port to use for HTTPS"
}

variable "container_port_protocol_https" {
  default = "TCP"
  description = "What protocol to use for HTTPS"
}

variable "container_storage_name" {
  default = "data"
  description = "storage name"
}

variable "container_storage_mount_path" {
  default = "/usr/share/nginx/html"
  description = "Mount path within container to mount the persistant volume share"
}