module "honeypot" {
  source = "../../modules/lxc"

  hostname    = "honeypot1001"
  target_node = "kitsune"
  memory      = 1024
  swap        = 1024
  network_ip  = "10.210.11.100/24"
  nesting     = true
}
