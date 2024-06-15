module "gateway1001" {
  source = "../../modules/lxc"

  hostname      = "personaldev1001"
  target_node   = "kitsune"
  memory        = 1024
  network_ip    = "10.210.3.1/24"
  root_password = var.password
  nesting       = true
}
