module "minecraftproxy1001" {
  source = "../../modules/lxc"

  hostname       = "minecraftproxy1001"
  target_node    = "kitsune"
  memory         = 1024
  swap           = 1024
  network_ip     = "10.210.30.101/24"
  rootfs_size    = "8G"
  rootfs_storage = "Synology-01-LUN-01"
  nesting        = true
}

# module "minecraft1002" {
#   source = "../../modules/vm"

#   name        = "minecraft1001"
#   target_node = "kitsune"
#   full_clone  = false
#   memory      = 8192
#   cores       = 4
#   ciuser      = var.ciuser
#   cipassword  = var.cipassword
#   ipconfig0   = "ip=10.210.30.1/24,gw=10.210.0.1"
#   storage     = "local-lvm"
#   size        = "128G"
# }
