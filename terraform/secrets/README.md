# secrets

`terraform.tfvars` ファイルをこのディレクトリ内に作成し、以下の内容を記述します。
このファイルは `.gitignore` に記載されているため、リポジトリにはコミットされません。

```hcl
proxmox_api_url  = "https://pve.local:8006/api2/json"
proxmox_user     = "terraform-prov@pam"
proxmox_password = "password"
ciuser           = "user"
cipassword       = "password"
```
