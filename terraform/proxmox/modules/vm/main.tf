resource "proxmox_vm_qemu" "main" {
  name             = var.name
  target_node      = var.target_node
  vmid             = var.vmid
  desc             = var.desc
  bios             = var.bios
  onboot           = var.onboot
  startup          = var.startup
  vm_state         = var.vm_state
  protection       = var.protection
  boot             = var.boot
  clone            = var.clone
  full_clone       = var.full_clone
  memory           = var.memory
  sockets          = var.sockets
  cores            = var.cores
  scsihw           = var.scsihw
  os_type          = var.os_type
  automatic_reboot = var.automatic_reboot
  ciuser           = var.ciuser
  cipassword       = var.cipassword
  searchdomain     = var.searchdomain
  nameserver       = var.nameserver
  sshkeys          = var.sshkeys
  ipconfig0        = var.ipconfig0

  disks {
    ide {
      ide3 {
        cloudinit {
          storage = var.storage
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          storage = var.storage
          size    = var.size
        }
      }
    }
  }
}
