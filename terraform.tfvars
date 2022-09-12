# Base Information
resource_group_name = "example-tf-aci"
location = "eastus"
environment = "non-prod-testing"
tags = {
    User = "who created it?"
    Type = "ACI"
    Project = "My test Project"
    CreatedBy = "Terraform (local az-cli)"
}

# Container Group Information
container_group_name = "aci-containergroup"
ip_address_type = "public"
dns_name_label = "aci-test-container-hello-world"
os_type = "linux"

# Container Information
container_name = "aci-nginx"
container_image = "nginx"
container_cpu = "1"
container_mem = "1"
container_port_http = "80"
container_port_protocol_http = "TCP"
container_port_https = "443"
container_port_protocol_https = "TCP"

# Storage Information
storage_account_name = "xxxstorageaccount"
storage_account_kind = "StorageV2"
storage_account_tier = "standard"
storage_account_replication = "LRS"
storage_account_https_traffic_only = "true"
storage_account_access_tier = "Hot"
storage_account_tls_version = "TLS1_2"
storage_account_shared_access_key_enabled = "true"