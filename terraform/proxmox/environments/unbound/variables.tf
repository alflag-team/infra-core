variable "proxmox_api_url" {
  type = string
}

variable "proxmox_user" {
  type = string
}

variable "proxmox_password" {
  type = string
}

variable "ciuser" {
  type      = string
  sensitive = true
}

variable "cipassword" {
  type      = string
  sensitive = true
}
