module "qemu" {
  source = "../../modules/qemu"

  name         = "cache1001"
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
  ipconfig0    = "ip=10.210.5.1/24,gw=10.210.0.1"
}
