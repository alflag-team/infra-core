resource "proxmox_lxc" "main" {
  target_node  = var.target_node
  hostname     = var.hostname
  ostemplate   = var.ostemplate
  password     = var.password
  memory       = var.memory
  unprivileged = var.unprivileged

  rootfs {
    storage = var.rootfs_storage
    size    = var.rootfs_size
  }

  network {
    name   = var.network_name
    bridge = var.network_bridge
    gw     = var.network_gateway
    ip     = var.network_ip
  }
}
