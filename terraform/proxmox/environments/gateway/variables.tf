variable "proxmox_api_url" {
  type    = string
  default = "https://10.210.1.1:8006/api2/json"
}

variable "password" {
  type      = string
  sensitive = true
}
