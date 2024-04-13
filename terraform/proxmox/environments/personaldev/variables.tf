variable "proxmox_user" {
  type      = string
  sensitive = true
}

variable "proxmox_password" {
  type      = string
  sensitive = true
}

variable "proxmox_api_url" {
  type    = string
  default = "http://10.210.1.1:8006/api2/json"
}

variable "root_password" {
  type      = string
  sensitive = true
}
