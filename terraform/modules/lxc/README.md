<!-- BEGIN_TF_DOCS -->
# LXC

Create LXC containers on Proxmox host.

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
| [proxmox_lxc.main](https://registry.terraform.io/providers/telmate/proxmox/latest/docs/resources/lxc) | resource |

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_hookscript"></a> [hookscript](#input\_hookscript) | n/a | `string` | `"local:snippets/hookscript.sh"` | no |
| <a name="input_hostname"></a> [hostname](#input\_hostname) | n/a | `string` | n/a | yes |
| <a name="input_memory"></a> [memory](#input\_memory) | n/a | `number` | `512` | no |
| <a name="input_nesting"></a> [nesting](#input\_nesting) | n/a | `bool` | `false` | no |
| <a name="input_network_bridge"></a> [network\_bridge](#input\_network\_bridge) | n/a | `string` | `"vmbr0"` | no |
| <a name="input_network_gateway"></a> [network\_gateway](#input\_network\_gateway) | n/a | `string` | `"10.210.0.1"` | no |
| <a name="input_network_ip"></a> [network\_ip](#input\_network\_ip) | n/a | `string` | n/a | yes |
| <a name="input_network_name"></a> [network\_name](#input\_network\_name) | n/a | `string` | `"eth0"` | no |
| <a name="input_onboot"></a> [onboot](#input\_onboot) | n/a | `bool` | `true` | no |
| <a name="input_ostemplate"></a> [ostemplate](#input\_ostemplate) | n/a | `string` | `"hdd-01:vztmpl/ubuntu-22.04-standard_22.04-1_amd64.tar.zst"` | no |
| <a name="input_root_password"></a> [root\_password](#input\_root\_password) | n/a | `string` | `"password"` | no |
| <a name="input_rootfs_size"></a> [rootfs\_size](#input\_rootfs\_size) | n/a | `string` | `"32G"` | no |
| <a name="input_rootfs_storage"></a> [rootfs\_storage](#input\_rootfs\_storage) | n/a | `string` | `"local-lvm"` | no |
| <a name="input_start"></a> [start](#input\_start) | n/a | `bool` | `true` | no |
| <a name="input_target_node"></a> [target\_node](#input\_target\_node) | n/a | `string` | n/a | yes |
| <a name="input_unprivileged"></a> [unprivileged](#input\_unprivileged) | n/a | `bool` | `true` | no |

## Outputs

No outputs.
<!-- END_TF_DOCS -->