<!-- BEGIN_TF_DOCS -->
# QEMU

VMs are created using [QEMU](https://www.qemu.org/). QEMU is a generic and open source machine emulator and virtualizer.

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | >=2.9.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | >=2.9.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [proxmox_vm_qemu.main](https://registry.terraform.io/providers/telmate/proxmox/latest/docs/resources/vm_qemu) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cicustom"></a> [cicustom](#input\_cicustom) | n/a | `string` | `"user=local:snippets/user-data.yaml"` | no |
| <a name="input_clone"></a> [clone](#input\_clone) | n/a | `string` | `"ubuntu-server-22.04"` | no |
| <a name="input_cores"></a> [cores](#input\_cores) | n/a | `number` | `1` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | n/a | `string` | `"16G"` | no |
| <a name="input_disk_storage"></a> [disk\_storage](#input\_disk\_storage) | n/a | `string` | `"hdd-01"` | no |
| <a name="input_disk_type"></a> [disk\_type](#input\_disk\_type) | n/a | `string` | `"scsi"` | no |
| <a name="input_ipconfig0"></a> [ipconfig0](#input\_ipconfig0) | n/a | `string` | n/a | yes |
| <a name="input_memory"></a> [memory](#input\_memory) | n/a | `number` | `1024` | no |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_os_type"></a> [os\_type](#input\_os\_type) | n/a | `string` | `"cloud-init"` | no |
| <a name="input_scsihw"></a> [scsihw](#input\_scsihw) | n/a | `string` | `"virtio-scsi-pci"` | no |
| <a name="input_sockets"></a> [sockets](#input\_sockets) | n/a | `number` | `1` | no |
| <a name="input_target_node"></a> [target\_node](#input\_target\_node) | n/a | `string` | n/a | yes |
| <a name="input_vmid"></a> [vmid](#input\_vmid) | n/a | `number` | `0` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_clone"></a> [clone](#output\_clone) | VMのクローン元 |
| <a name="output_disk_size"></a> [disk\_size](#output\_disk\_size) | VMのディスクサイズ |
| <a name="output_disk_storage"></a> [disk\_storage](#output\_disk\_storage) | VMのディスクストレージ |
| <a name="output_disk_type"></a> [disk\_type](#output\_disk\_type) | VMのディスクタイプ |
| <a name="output_memory"></a> [memory](#output\_memory) | VMのメモリサイズ |
| <a name="output_name"></a> [name](#output\_name) | VMの名前 |
| <a name="output_os_type"></a> [os\_type](#output\_os\_type) | VMのOSタイプ |
| <a name="output_target_node"></a> [target\_node](#output\_target\_node) | VMのノード名 |
| <a name="output_vmid"></a> [vmid](#output\_vmid) | VMのID |
<!-- END_TF_DOCS -->