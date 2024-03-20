resource "proxmox_virtual_environment_vm" "main" {
  name        = var.name
  description = var.description
  tags        = var.tags

  node_name = var.node_name

  cpu {
    architecture = var.cpu_architecture
    cores        = var.cpu_cores
    sockets      = var.cpu_sockets
  }

  disk {
    datastore_id = var.disk_datastore_id
    file_id      = var.disk_file_id
    interface    = var.disk_interface
    size         = var.disk_size
  }

  initialization {
    ip_config {
      ipv4 {
        address = var.ipv4_address
        gateway = var.ipv4_gateway
      }
    }

    user_account {
      keys     = var.user_account_keys
      username = var.user_account_username
    }
  }

  memory {
    dedicated = var.memory_dedicated
    floating  = 0
    shared    = 0
  }

  network_device {
    bridge = "vmbr0"
  }

  operating_system {
    type = var.operating_system_type
  }

  startup {
    order      = var.startup_order
    up_delay   = var.startup_up_delay
    down_delay = var.startup_down_delay
  }
}
