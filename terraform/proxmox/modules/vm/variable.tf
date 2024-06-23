variable "name" {
  description = "Name of the VM"
  type        = string
}

variable "target_node" {
  description = "Node to deploy the VM"
  type        = string
}

variable "vmid" {
  description = "VM ID"
  type        = number
  default     = 0
}

variable "desc" {
  description = "Description of the VM"
  type        = string
  default     = "Managed by Terraform"
}

variable "bios" {
  description = "BIOS type"
  type        = string
  default     = "seabios"
}

variable "onboot" {
  description = "Start the VM on boot"
  type        = bool
  default     = true
}

variable "startup" {
  description = "Startup behavior"
  type        = string
  default     = ""
}

variable "vm_state" {
  description = "VM state"
  type        = string
  default     = "running"
}

variable "protection" {
  description = "Protection"
  type        = bool
  default     = false
}

variable "boot" {
  description = "Boot order"
  type        = string
  default = "order=scsi0"
}

variable "clone" {
  description = "Clone"
  type        = string
  default     = "ubuntu-server-22.04"
}

variable "full_clone" {
  description = "Full clone"
  type        = bool
  default     = true
  # ISCSI is not support linked clones
}

variable "memory" {
  description = "Memory size"
  type        = number
  default     = 1024
}

variable "sockets" {
  description = "Number of sockets"
  type        = number
  default     = 1
}

variable "cores" {
  description = "Number of cores"
  type        = number
  default     = 1
}

variable "scsihw" {
  description = "SCSI hardware"
  type        = string
  default     = "virtio-scsi-pci"
}

variable "os_type" {
  description = "OS type"
  type        = string
  default     = "cloud-init"
}

variable "automatic_reboot" {
  description = "Automatic reboot"
  type        = bool
  default     = true
}

variable "ciuser" {
  description = "Cloud-init user"
  type        = string
}

variable "cipassword" {
  description = "Cloud-init password"
  type        = string
}

variable "searchdomain" {
  description = "Search domain"
  type        = string
  default     = "alflag.internal"
}

variable "nameserver" {
  description = "Name server"
  type        = string
  default     = "127.0.0.1"
}

variable "sshkeys" {
  # infra.pub is the public key of the infra user
  description = "SSH keys"
  type        = string
  default     = <<-EOT
    ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIECXPPShDyRAzNSsgLZ8nVZ4eyEcdKBpb4+vIadMWxlf
EOT
}

variable "ipconfig0" {
  description = "IP configuration"
  type        = string
}

variable "iso" {
  description = "ISO to boot from"
  type        = string
  default     = "hdd-01:iso/jammy-server-cloudimg-amd64.img"
}

variable "storage" {
  description = "Storage"
  type        = string
  default     = "Synology-01-LUN-01"
}

variable "size" {
  description = "Disk size"
  type        = string
  default     = "16G"
}
