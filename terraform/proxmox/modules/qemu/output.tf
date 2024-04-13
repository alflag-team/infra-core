output "name" {
  description = "VMの名前"
  value       = proxmox_vm_qemu.main.name
}

output "target_node" {
  description = "VMのノード名"
  value       = proxmox_vm_qemu.main.target_node
}

output "vmid" {
  description = "VMのID"
  value       = proxmox_vm_qemu.main.vmid
}

output "clone" {
  description = "VMのクローン元"
  value       = proxmox_vm_qemu.main.clone
}

output "memory" {
  description = "VMのメモリサイズ"
  value       = proxmox_vm_qemu.main.memory
}

output "os_type" {
  description = "VMのOSタイプ"
  value       = proxmox_vm_qemu.main.os_type
}

output "disk_type" {
  description = "VMのディスクタイプ"
  value       = proxmox_vm_qemu.main.disk.0.type
}

output "disk_storage" {
  description = "VMのディスクストレージ"
  value       = proxmox_vm_qemu.main.disk.0.storage
}

output "disk_size" {
  description = "VMのディスクサイズ"
  value       = proxmox_vm_qemu.main.disk.0.size
}
