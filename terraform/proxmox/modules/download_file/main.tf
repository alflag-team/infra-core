resource "proxmox_virtual_environment_download_file" "main" {
  content_type = var.content_type
  datastore_id = var.datastore_id
  node_name    = var.node_name
  url          = var.url
}
