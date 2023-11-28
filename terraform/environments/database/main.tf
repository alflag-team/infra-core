module "lxc" {
  source = "../../modules/lxc"

  hostname      = "database1001"
  target_node   = "kitsune"
  memory        = 2048
  network_ip    = "10.210.4.2/24"
  root_password = var.root_password
}
