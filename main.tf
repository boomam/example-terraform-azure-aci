# Create Resource Group
resource "azurerm_resource_group" "rg" {
  name      = "${var.resource_group_name}_${var.environment}"
  location  = var.location
  tags      = var.tags
}

# Create storage account to store files
resource "azurerm_storage_account" "temp_storage_account" {
  name                                  = var.storage_account_name
  resourcesource_group_name             = azurerm_resource_group.rg.name
  tags                                  = var.tags
  location                              = var.location
  account_kind                          = var.storage_account_kind
  account_tier                          = var.storage_account_tier
  account_replication_type              = var.storage_account_replication
  enable_https_traffic_only             = var.storage_account_https_traffic_only
  access_tier                           = var.storage_account_access_tier
  min_tls_version                       = var.storage_account_tls_version
  shared_access_key_enabled             = var.storage_account_shared_access_key_enabled
}

# Mark Storage Account primary acess key as sensitive so it is masked in output
output "temp_storage_account_primary_access_key" {
  value         = azurerm_storage_account.temp_storage_account.primary_access_key
  description   = "The account key used for az storage cli commands"
  sensitive     = true
}

# Create a file share in the storage account to store file(s)
resource "azurerm_storage_share" "storage_share" {
  name                  = var.storage_account_share_name
  storage_account_name  = azurerm_storage_account.temp_storage_account.name
  quota                 = var.storage_account_share_quota
}

# Create container group
resource "azurerm_container_group" "my_container_group" {
  name                  = var.container_group_name
  location              = var.location
  resource_group_name   = azurerm_resource_group.rg.name
  tags                  = var.tags
  ip_address_type       = var.ip_address_type
  dns_name_label        = var.dns_name_label
  os_type               = var.os_type


# Container / Image Configuration
  container {
    name        = var.container_name
    image       = var.container_image
    cpu         = var.container_cpu
    memory      = var.container_mem
  }

# Container - Networking Configuration
  # 80/tcp
  ports {
    port        = var.container_port_http
    protocol    = var.container_port_protocol_http
    }
  # 443/tcp
  ports {
    port        = var.container_port_https
    protocol    = var.container_port_protocol_https
    }  
  
# Container - Volume Mount Points
  volume {
    name                    = var.container_storage_name
    mount_path              = var.container_storage_mount_path
    read_only               = false
    share_name              = var/storage_account_share_name
    storage_account_name    = azurerm_storage_account.temp_storage_account.name
    storage_account_key     = azurerm_storage_account.temp_storage_account.primary_access_key
    }
  }
  