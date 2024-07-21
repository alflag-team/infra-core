terraform {
  required_providers {
    proxmox = {
      source  = "telmate/proxmox"
      version = "3.0.1-rc3"
    }
  }

  cloud {
    organization = "alflag"

    workspaces {
      name = "unbound"
    }
  }

  # backend "local" {
  #   path = "local.tfstate"
  # }
}
