module "latest_ubuntu_22_jammy_img" {
  source = "../../modules/download_file"

  url = var.url

  node_name = var.node_name
}
