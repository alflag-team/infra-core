resource "proxmox_vm_qemu" "main" {
  name        = var.name
  target_node = var.target_node
  vmid = var.vmid
  desc = var.desc
  bios = var.bios
  onboot = var.onboot
  startup = var.startup
  vm_state = var.vm_state
  protection = var.protection
  memory = var.memory
  sockets = var.sockets
  cores = var.cores
  automatic_reboot = var.automatic_reboot
  ciuser = var.ciuser
  cipassword = var.cipassword
  searchdomain = var.searchdomain
  nameserver = var.nameserver
  sshkeys = var.sshkeys

  disks {
    virtio {
      virtio0 {
        cdrom {
          iso = var.iso
        }
      }
    }
    scsi {
      scsi0 {
        disk {
          storage = var.storage
          size = var.size
        }
      }
    }
  }
}