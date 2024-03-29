terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = ">=2.9.0"
    }
  }

  cloud {
    organization = "alflag"

    workspaces {
      name = "steamg"
    }
  }
}
