module "qemu" {
  source = "../../modules/qemu"

  name         = "database1003"
  target_node  = "kitsune"
  vmid         = 0
  clone        = "ubuntu-server-22.04"
  cores        = 2
  sockets      = 1
  memory       = 2048
  os_type      = "cloud-init"
  disk_type    = "scsi"
  disk_storage = "local-lvm"
  disk_size    = "32G"
  ipconfig0    = "ip=10.210.4.3/24,gw=10.210.0.1"
}
