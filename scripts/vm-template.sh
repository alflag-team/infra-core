#!/usr/bin/env bash

VM_ID=9000
VM_NAME=ubuntu-server-22.04
VM_CORES=2
VM_MEMORY=$((1024))
VM_STORAGE=local-lvm

# Function to handle errors and cleanup
handle_error() {
    echo "Error: $1"
    if [ -e jammy-server-cloudimg-amd64.img ]; then
        rm jammy-server-cloudimg-amd64.img
    fi
    exit 1
}

# Download Ubuntu Server 22.04 LTS
wget https://cloud-images.ubuntu.com/jammy/current/jammy-server-cloudimg-amd64.img
if [ $? -eq 0 ]; then
    echo "Success: Downloaded Ubuntu Server image successfully."
else
    handle_error "Failed to download Ubuntu Server image."
fi

# Resize the image to 4GB
qemu-img resize jammy-server-cloudimg-amd64.img 4G
if [ $? -eq 0 ]; then
    echo "Success: Resized image to 4GB successfully."
else
    handle_error "Failed to resize image."
fi

# Create a new VM with VirtIO SCSI controller
qm create $VM_ID --name $VM_NAME --memory $VM_MEMORY --net0 virtio,bridge=vmbr0 --scsihw virtio-scsi-pci
if [ $? -eq 0 ]; then
    echo "Success: Created VM $VM_NAME successfully."
else
    handle_error "Failed to create VM $VM_NAME."
fi

# Import the downloaded image to local-lvm storage
qm set $VM_ID --virtio0 $VM_STORAGE:0,import-from=$(pwd)/jammy-server-cloudimg-amd64.img
if [ $? -eq 0 ]; then
    echo "Success: Imported image to VM storage successfully."
else
    handle_error "Failed to import image to VM storage."
fi

# Set Cloud-Init drive to the VM
qm set $VM_ID --ide2 $VM_STORAGE:cloudinit
if [ $? -eq 0 ]; then
    echo "Success: Set Cloud-Init drive successfully."
else
    handle_error "Failed to set Cloud-Init drive."
fi

# Set bootdisk to virtio0
qm set $VM_ID --boot order=virtio0
if [ $? -eq 0 ]; then
    echo "Success: Set boot order successfully."
else
    handle_error "Failed to set boot order."
fi

# Set serial0 to socket and enable serial console
qm set $VM_ID --serial0 socket --vga serial0
if [ $? -eq 0 ]; then
    echo "Success: Configured serial console successfully."
else
    handle_error "Failed to configure serial console."
fi

# Template the VM
qm template $VM_ID
if [ $? -eq 0 ]; then
    echo "Success: Templated VM $VM_NAME successfully."
else
    handle_error "Failed to template VM $VM_NAME."
fi

# Delete the downloaded image
rm jammy-server-cloudimg-amd64.img
if [ $? -eq 0 ]; then
    echo "Success: Deleted downloaded image successfully."
else
    handle_error "Failed to delete downloaded image."
fi

echo "Success: All steps completed successfully."
