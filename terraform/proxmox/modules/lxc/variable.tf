variable "hostname" {
  type = string
}

variable "target_node" {
  type = string
}

variable "root_password" {
  type    = string
  default = "password"
}

variable "onboot" {
  type    = bool
  default = true
}

variable "ssh_public_keys" {
  # infra.pub is the public key of the infra user
  type    = string
  default = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIECXPPShDyRAzNSsgLZ8nVZ4eyEcdKBpb4+vIadMWxlf
  EOT
}

variable "start" {
  type    = bool
  default = true
}

variable "memory" {
  type    = number
  default = 512
}

variable "ostemplate" {
  type    = string
  default = "hdd-01:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"
}

variable "unprivileged" {
  type    = bool
  default = true
}

variable "network_name" {
  type    = string
  default = "eth0"
}

variable "network_bridge" {
  type    = string
  default = "vmbr0"
}

variable "network_gateway" {
  type    = string
  default = "10.210.0.1"
}

variable "network_ip" {
  type = string
}

variable "rootfs_size" {
  type    = string
  default = "32G"
}

variable "rootfs_storage" {
  type    = string
  default = "local-lvm"
}

variable "nesting" {
  type    = bool
  default = false
}
