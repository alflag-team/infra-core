resource "proxmox_vm_qemu" "ubuntu-test" {
  name        = "ubuntu-test"
  target_node = "kitsune"
  clone       = "ubuntu-server-22.04"
  memory      = 2048
  os_type     = "cloud-init"

  disk {
    type    = "scsi"
    storage = "hdd-01"
    size    = "20G"
  }
}
