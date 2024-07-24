module "unbound1001" {
  source = "../../modules/lxc"

  hostname       = "unbound1001"
  target_node    = "kitsune"
  memory         = 1024
  swap           = 8192
  network_ip     = "10.210.9.1/24"
  rootfs_size    = "8G"
  rootfs_storage = "Synology-01-LUN-01"
  nesting        = true
}
