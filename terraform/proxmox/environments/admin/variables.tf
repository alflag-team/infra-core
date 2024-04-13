variable "endpoint" {
  type    = string
  default = "https://10.210.1.1:8006/"
}

# variable "username" {
#   type      = string
#   sensitive = true
# }

# variable "password" {
#   type      = string
#   sensitive = true
# }

variable "disk_file_id" {
  type    = string
  default = "hdd-01:iso/jammy-server-cloudimg-amd64.img"
}
