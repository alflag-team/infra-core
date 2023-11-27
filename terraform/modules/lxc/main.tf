resource "proxmox_lxc" "main" {
  target_node  = var.target_node
  hostname     = var.hostname
  ostemplate   = var.ostemplate
  password     = var.root_password
  memory       = var.memory
  unprivileged = var.unprivileged
  onboot       = var.onboot
  hookscript   = var.hookscript

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
