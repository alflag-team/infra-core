module "log1001" {
  source = "../../modules/qemu"

  name         = "log1001"
  target_node  = "kitsune"
  vmid         = 0
  clone        = "ubuntu-server-22.04"
  cores        = 2
  sockets      = 1
  memory       = 1024
  os_type      = "cloud-init"
  disk_type    = "scsi"
  disk_storage = "hdd-01"
  disk_size    = "32G"
  ipconfig0    = "ip=10.210.7.1/24,gw=10.210.0.1"
}
