variable "name" {
  type = string
}

variable "target_node" {
  type = string
}

variable "vmid" {
  type = number
  default = 0
}

variable "clone" {
  type    = string
  default = "ubuntu-server-22.04"
}

variable "cores" {
  type    = number
  default = 1
}

variable "sockets" {
  type    = number
  default = 1
}

variable "memory" {
  type    = number
  default = 1024
}

variable "os_type" {
  type    = string
  default = "cloud-init"
}

variable "scsihw" {
  type    = string
  default = "virtio-scsi-pci"
}

variable "disk_type" {
  type    = string
  default = "scsi"
}

variable "disk_storage" {
  type    = string
  default = "hdd-01"
}

variable "disk_size" {
  type    = string
  default = "16G"
}

variable "cicustom" {
  type    = string
  default = "user=local:snippets/user-data.yaml"
}

variable "ipconfig0" {
  type = string
}
