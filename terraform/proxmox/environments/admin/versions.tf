terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "~> 0.49.0"
    }
  }

  cloud {
    organization = "alflag"

    workspaces {
      name = "admin"
    }
  }

  # backend "local" {}
}
