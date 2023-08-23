variable "name" {
  type = string
}

variable "target_node" {
  type = string
}

variable "clone" {
  type = string
  default = "ubuntu-server-22.04"
}

variable "memory" {
  type = number
  default = 1024
}

variable "os_type" {
  type = string
  default = "cloud-init"
}

variable "disk_type" {
  type = string
  default = "scsi"
}

variable "disk_storage" {
  type = string
  default = "hdd-01"
}

variable "disk_size" {
  type = string
  default = "16G"
}
