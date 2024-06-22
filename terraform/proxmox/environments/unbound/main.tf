module "unbound1001" {
  source = "../../modules/lxc"

  hostname      = "unbound1001"
  target_node   = "kitsune"
  memory        = 1024
  network_ip    = "10.210.9.1/24"
  nesting       = true
}
