resource "proxmox_vm_qemu" "main" {
  name        = var.name
  target_node = var.target_node
  clone       = var.clone
  memory      = var.memory
  os_type     = var.os_type

  disk {
    type    = var.disk_type
    storage = var.disk_storage
    size    = var.disk_size
  }
}
