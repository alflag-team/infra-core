module "qemu" {
  source = "../../modules/qemu"

  name = "test"
  target_node = "kitsune"
  clone = "ubuntu-server-22.04"
  memory = 1024
  os_type = "cloud-init"
  disk_type = "scsi"
  disk_storage = "hdd-01"
  disk_size = "16G"
}