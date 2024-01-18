module "qemu" {
  source = "../../modules/lxc"

  hostname      = "personaldev1001"
  target_node   = "kitsune"
  memory        = 2048
  network_ip    = "10.210.4.1/24"
  root_password = var.root_password
}
