module "qemu" {
  source = "../../modules/qemu"

  name         = "test"
  target_node  = "kitsune"
  vmid         = 0
  clone        = "ubuntu-server-22.04"
  memory       = 1024
  os_type      = "cloud-init"
  disk_type    = "scsi"
  disk_storage = "hdd-01"
  disk_size    = "16G"
  ipconfig     = "ip=10.0.10.100/8,gw=10.0.0.1"
}
