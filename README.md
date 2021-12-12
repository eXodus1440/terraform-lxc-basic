# terraform-lxc-basic
Deploying basic LXC container into Proxmox with Terraform

Initalise terraform
`terraform init`

Create a tfvars file and populate it with your variables
```bash
cat << 'EOF' > terraform-lxc-basic.auto.tfvars
pm_api_url = "https://<PROXMOX IP>:8006/api2/json"
pm_user = "root@pam"
pm_password = "root@pam"

EOF
```

Creates an execution plan to preview the changes
`terraform plan`

Apply the proposed changes
`terraform apply`

To delete all remote objects managed by a particular Terraform configuration
`terraform destroy`
