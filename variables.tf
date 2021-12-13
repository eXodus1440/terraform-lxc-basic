// Provider config - create a tfvars file and populate it with your connection details
variable "pm_api_url" { default = "https://<PROXMOX IP>:8006/api2/json" }
variable "pm_user" { default = "root@pam" }
variable "pm_password" { default = "root@pam" sensitive = true }

// Resource config
variable "target_node" { default = "pve1" }
variable "ostemplate" { default = "local:vztmpl/ubuntu-21.04-standard_21.04-1_amd64.tar.gz" }
variable "ostype" { default = "ubuntu" }
variable "onboot" { default = true }
variable "start" { default = true }
variable "password" { default = "BasicLXCContainer" sensitive = true }

// Resource root FS
variable "storage" { default = "local-lvm" }
variable "size" { default = "8G" }

// Resource Networking
variable "ip" { default = "dhcp" }
