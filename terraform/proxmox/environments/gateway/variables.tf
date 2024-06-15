variable "proxmox_api_url" {
  type    = string
  default = "https://10.210.1.1:8006/"
}

variable "password" {
  type      = string
  sensitive = true
}
