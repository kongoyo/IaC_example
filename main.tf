terraform {
  required_providers {
    ibm = {
      source  = "IBM-Cloud/ibm"
      version >= "1.40.0" # 確保您使用的是最新版本
    }
  }
}

provider "ibm" {
  ibmcloud_api_key = var.ibmcloud_api_key
  region = "jp-tok"
}

resource "ibm_pi_instance" "ibmi_vsi" {
  pi_cloud_instance_id  = var.cloud_instance_id
  pi_sys_type           = "s922"    # 您可以選擇合適的系統類型
  pi_image_id           = var.image_id
  pi_network_id         = var.network_id
  pi_memory             = 16
  pi_processors         = 0.25
  pi_proc_type          = "shared"
  pi_storage_pool       = var.storage_pool
  pi_key_name           = var.ssh_key_name
}

resource "ibm_pi_network" "cloud_connection" {
  name                 = "my_cloud_connection"
  type                 = "cloud"
  cloud_instance_id    = var.cloud_instance_id
  network_cidr         = var.network_cidr
  speed                = 1000
  metered              = false
  global_routing       = false
}
