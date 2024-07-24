module "minecraftpanel1001" {
  source = "../../modules/lxc"

  hostname       = "minecraftpanel1001"
  target_node    = "kitsune"
  memory         = 2048
  swap           = 8192
  network_ip     = "10.210.30.111/24"
  rootfs_size    = "16G"
  rootfs_storage = "Synology-01-LUN-01"
  nesting        = true
}

module "minecraftproxy1001" {
  source = "../../modules/lxc"

  hostname       = "minecraftproxy1001"
  target_node    = "kitsune"
  memory         = 2048
  swap           = 8192
  network_ip     = "10.210.30.101/24"
  rootfs_size    = "8G"
  rootfs_storage = "Synology-01-LUN-01"
  nesting        = true
}

module "minecraft2001" {
  source = "../../modules/vm"

  name        = "minecraft2001"
  target_node = "kitsune"
  memory      = 8192
  ipconfig0   = "gw=10.210.0.1,ip=10.210.30.1/24"
  size        = "64G"

  ciuser     = var.ciuser
  cipassword = var.cipassword
}
