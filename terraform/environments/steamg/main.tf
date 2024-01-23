module "qemu" {
  source = "../../modules/qemu"

  name         = "steamg1001"
  target_node  = "kitsune"
  vmid         = 0
  clone        = "ubuntu-server-22.04"
  cores        = 2
  sockets      = 1
  memory       = 8192
  os_type      = "cloud-init"
  disk_type    = "scsi"
  disk_storage = "local-lvm"
  disk_size    = "128G"
  ipconfig0    = "ip=10.210.31.4/24,gw=10.210.0.1"
}
