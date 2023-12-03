module "qemu" {
  source = "../../modules/qemu"

  name         = "web1"
  target_node  = "kitsune"
  vmid         = 0
  clone        = "ubuntu-server-22.04"
  cores        = 2
  sockets      = 1
  memory       = 2048
  os_type      = "cloud-init"
  disk_type    = "scsi"
  disk_storage = "hdd-01"
  disk_size    = "16G"
  ipconfig0    = "ip=10.210.100.1/24,gw=10.0.0.1"
}
