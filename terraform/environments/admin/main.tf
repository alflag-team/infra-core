module "admin1002" {
  source = "../../modules/vm"

  name        = "admin1002"
  description = "admin1002"

  node_name = "kitsune"

  cpu_cores = 2

  disk_datastore_id = "hdd-01"
  disk_file_id      = var.disk_file_id
  disk_size         = 32

  ipv4_address = "10.210.6.2/24"
  ipv4_gateway = "10.210.0.1"

  user_account_keys     = ["ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIJdpqfqxJQBhiisSoRomP7bsvG3iqA7bsSmBkDYupUFK"]
  user_account_username = "infra"

  memory_dedicated = 2048
}
