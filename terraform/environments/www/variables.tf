variable "proxmox_api_url" {
  type = string
  default = "http://10.0.10.1:8006/api2/json"
}

variable "proxmox_user" {
  type = string
  default = "root@pam"
}

variable "proxmox_password" {
  type = string
  sensitive = true
  default = "password"
}