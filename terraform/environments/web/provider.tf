provider "proxmox" {
  pm_api_url      = var.proxmox_api_url
  pm_tls_insecure = true
}
