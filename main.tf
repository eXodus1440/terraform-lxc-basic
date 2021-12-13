terraform {
  required_providers {
    proxmox = {
      source  = "Telmate/proxmox"
      version = "2.9.3"
    }
  }
}

provider "proxmox" {
  pm_api_url = var.pm_api_url
  pm_user = var.pm_user
  pm_password = var.pm_password
  // pm_tls_insecure = true
  // pm_parallel = 1
}

resource "proxmox_lxc" "basic" {
  features {
    nesting = true
  }
  count        = 1
  target_node  = var.target_node 
  hostname     = "lxc-basic-${count.index+1}" 
  ostemplate   = var.ostemplate
  password     = var.password
  unprivileged = true
  ostype       = var.ostype
  onboot       = var.onboot
  start        = var.start

  rootfs {
    storage = var.storage
    size    = var.size
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = var.ip
  }
}

