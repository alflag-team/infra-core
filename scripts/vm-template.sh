#!/usr/bin/env bash

VM_ID=9000
VM_NAME=ubuntu-server-22.04
VM_CORES=2
VM_MEMORY=$(( 1024 ))
VM_STORAGE=local-lvm

# Download Ubuntu Server 22.04 LTS
wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img

# Create a new VM with VirtIO SCSI controller
qm create $VM_ID --name $VM_NAME --memory $VM_MEMORY --net0 virtio,bridge=vmbr0 --scsihw virtio-scsi-pci

# Import the downloaded image to local-lvm storage
qm set $VM_ID --scsi0 $VM_STORAGE:0,import-from=$(pwd)/jammy-server-cloudimg-amd64.img

# Set Cloud-Init drive to the VM
qm set $VM_ID --ide2 $VM_STORAGE:cloudinit

# Set bootdisk to scsi0
qm set $VM_ID --boot order=scsi0

# Set serial0 to socket and enable serial console
qm set $VM_ID --serial0 socket --vga serial0

# Template the VM
qm template $VM_ID

# Delete the downloaded image
rm jammy-server-cloudimg-amd64.img
