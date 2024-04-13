variable "name" {
  type = string
}

variable "description" {
  type = string
}

variable "tags" {
  type    = list(string)
  default = []
}

variable "node_name" {
  type = string
}

variable "cpu_architecture" {
  type    = string
  default = "x86_64"
}

variable "cpu_cores" {
  type    = number
  default = 1
}

variable "cpu_sockets" {
  type    = number
  default = 1
}

variable "disk_datastore_id" {
  type = string
}

variable "disk_file_id" {
  type = string
}

variable "disk_interface" {
  type    = string
  default = "virtio0"
}

variable "disk_size" {
  type    = number
  default = 8
}

variable "ipv4_address" {
  type = string
}

variable "ipv4_gateway" {
  type = string
}

variable "user_account_keys" {
  type    = list(string)
  default = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIECXPPShDyRAzNSsgLZ8nVZ4eyEcdKBpb4+vIadMWxlf"]
}

variable "user_account_username" {
  type    = string
  default = "infra"
}

variable "memory_dedicated" {
  type = number
}

variable "operating_system_type" {
  type    = string
  default = "l26"
}

variable "startup_order" {
  type    = number
  default = 3
}

variable "startup_up_delay" {
  type    = number
  default = 60
}

variable "startup_down_delay" {
  type    = number
  default = 60
}