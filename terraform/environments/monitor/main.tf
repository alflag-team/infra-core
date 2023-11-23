module "lxc" {
  source = "../../modules/lxc"

  hostname    = "monitor1000"
  target_node = "kitsune"
  network_ip  = "10.210.2.2/24"
  password    = "password"
}
