module "personaldev1001" {
  source = "../../modules/lxc"

  hostname      = "personaldev1001"
  target_node   = "kitsune"
  memory        = 2048
  network_ip    = "10.210.11.1/24"
  root_password = var.root_password
}

module "personaldev1002" {
  source = "../../modules/lxc"

  hostname      = "personaldev1002"
  target_node   = "kitsune"
  memory        = 1024
  network_ip    = "10.210.11.2/24"
  root_password = var.root_password
  nesting       = true
}
