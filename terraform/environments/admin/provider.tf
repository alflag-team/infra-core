provider "proxmox" {
  endpoint = var.endpoint
  # username = var.username
  # password = var.password
  insecure = true

  ssh {
    agent = true
  }
}
