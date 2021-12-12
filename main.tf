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
  target_node  = "pve1"
  hostname     = "lxc-basic-${count.index+1}"
  ostemplate   = "local:vztmpl/ubuntu-21.04-standard_21.04-1_amd64.tar.gz"
  password     = "BasicLXCContainer"
  unprivileged = true
  ostype       = "ubuntu"
  // onboot       = true
  start        = true

  // Terraform will crash without rootfs defined
  rootfs {
    storage = "local-lvm"
    size    = "8G"
  }

  network {
    name   = "eth0"
    bridge = "vmbr0"
    ip     = "dhcp"
  }
}

