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
      name = "minecraft"
    }
  }

  # backend "local" {
  #   path = "local.tfstate"
  # }
}
