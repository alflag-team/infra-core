resource "proxmox_vm_qemu" "main" {
  name        = var.name
  target_node = var.target_node
  vmid        = var.vmid
  clone       = var.clone
  cores       = var.cores
  sockets     = var.sockets
  memory      = var.memory
  os_type     = var.os_type
  scsihw      = var.scsihw
  cicustom    = var.cicustom
  ipconfig0   = var.ipconfig0

  disk {
    type    = var.disk_type
    storage = var.disk_storage
    size    = var.disk_size
  }
}
