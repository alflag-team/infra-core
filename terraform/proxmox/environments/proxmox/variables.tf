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

variable "url" {
  type    = string
  default = "https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img"
}

variable "node_name" {
  type    = string
  default = "kitsune"
}
