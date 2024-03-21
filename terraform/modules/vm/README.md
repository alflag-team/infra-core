<!-- BEGIN_TF_DOCS -->
# vm

Manages a virtual machine.

- [proxmox\_virtual\_environment\_vm](https://registry.terraform.io/providers/bpg/proxmox/latest/docs/resources/virtual_environment_vm)

## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_proxmox"></a> [proxmox](#requirement\_proxmox) | ~> 0.49.0 |

## Providers

| Name | Version |
|------|---------|
| <a name="provider_proxmox"></a> [proxmox](#provider\_proxmox) | ~> 0.49.0 |

## Modules

No modules.

## Resources

| Name | Type |
|------|------|
| [proxmox_virtual_environment_vm.main](https://registry.terraform.io/providers/bpg/proxmox/latest/docs/resources/virtual_environment_vm) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_cpu_architecture"></a> [cpu\_architecture](#input\_cpu\_architecture) | n/a | `string` | `"x86_64"` | no |
| <a name="input_cpu_cores"></a> [cpu\_cores](#input\_cpu\_cores) | n/a | `number` | `1` | no |
| <a name="input_cpu_sockets"></a> [cpu\_sockets](#input\_cpu\_sockets) | n/a | `number` | `1` | no |
| <a name="input_description"></a> [description](#input\_description) | n/a | `string` | n/a | yes |
| <a name="input_disk_datastore_id"></a> [disk\_datastore\_id](#input\_disk\_datastore\_id) | n/a | `string` | n/a | yes |
| <a name="input_disk_file_id"></a> [disk\_file\_id](#input\_disk\_file\_id) | n/a | `string` | n/a | yes |
| <a name="input_disk_interface"></a> [disk\_interface](#input\_disk\_interface) | n/a | `string` | `"virtio0"` | no |
| <a name="input_disk_size"></a> [disk\_size](#input\_disk\_size) | n/a | `number` | `8` | no |
| <a name="input_ipv4_address"></a> [ipv4\_address](#input\_ipv4\_address) | n/a | `string` | n/a | yes |
| <a name="input_ipv4_gateway"></a> [ipv4\_gateway](#input\_ipv4\_gateway) | n/a | `string` | n/a | yes |
| <a name="input_memory_dedicated"></a> [memory\_dedicated](#input\_memory\_dedicated) | n/a | `number` | n/a | yes |
| <a name="input_name"></a> [name](#input\_name) | n/a | `string` | n/a | yes |
| <a name="input_node_name"></a> [node\_name](#input\_node\_name) | n/a | `string` | n/a | yes |
| <a name="input_operating_system_type"></a> [operating\_system\_type](#input\_operating\_system\_type) | n/a | `string` | `"l26"` | no |
| <a name="input_startup_down_delay"></a> [startup\_down\_delay](#input\_startup\_down\_delay) | n/a | `number` | `60` | no |
| <a name="input_startup_order"></a> [startup\_order](#input\_startup\_order) | n/a | `number` | `3` | no |
| <a name="input_startup_up_delay"></a> [startup\_up\_delay](#input\_startup\_up\_delay) | n/a | `number` | `60` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | n/a | `list(string)` | `[]` | no |
| <a name="input_user_account_keys"></a> [user\_account\_keys](#input\_user\_account\_keys) | n/a | `list(string)` | n/a | yes |
| <a name="input_user_account_username"></a> [user\_account\_username](#input\_user\_account\_username) | n/a | `string` | n/a | yes |

## Outputs

No outputs.
<!-- END_TF_DOCS -->