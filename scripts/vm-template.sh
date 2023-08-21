#!/usr/bin/env bash

VM_ID=9000
VM_NAME=ubuntu-server-22.04
VM_CORES=2
VM_MEMORY=1024*2
VM_STORAGE=local-lvm

# Download Ubuntu Server 22.04 LTS
wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img

# Create a new VM with VirtIO SCSI controller
qm create $VM_ID --name $VM_NAME --memory $VM_MEMORY --cores $VM_CORES --net0 virtio,bridge=vmbr0 --scsihw virtio-scsi-pci

# Import the downloaded image to local-lvm storage
qm importdisk $VM_ID jammy-server-cloudimg-amd64.img hdd-01

# Attach the disk to the VM
qm set $VM_ID --scsihw virtio-scsi-pci --scsi0 $VM_STORAGE:vm-$VM_ID-disk-0

# Set Cloud-Init drive to the VM
qm set $VM_ID --ide2 $VM_STORAGE:cloudinit

# Set bootdisk to the disk we just attached
qm set $VM_ID --boot c --bootdisk scsi0

# Set serial0 to socket and enable serial console
qm set $VM_ID --serial0 socket --vga serial0

# Template the VM
qm template $VM_ID

# Delete the downloaded image
rm jammy-server-cloudimg-amd64.img
