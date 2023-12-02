module "qemu" {
  source = "../../modules/qemu"

  name         = "monitor1002"
  target_node  = "kitsune"
  vmid         = 0
  clone        = "ubuntu-server-22.04"
  cores        = 2
  sockets      = 1
  memory       = 1024
  os_type      = "cloud-init"
  disk_type    = "scsi"
  disk_storage = "local-lvm"
  disk_size    = "32G"
  ipconfig0    = "ip=10.210.2.2/24,gw=10.210.0.1"
}
