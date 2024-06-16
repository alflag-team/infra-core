# environments

## デプロイ方法

`terraform.tfvars` ファイルを env ディレクトリ内に作成し、以下の内容を記述します。
このファイルは `.gitignore` に記載されているため、リポジトリにはコミットされません。

```hcl
proxmox_api_url  = "https://pve.local:8006/api2/json"
proxmox_user     = "terraform-prov@pve"
proxmox_password = "password"
```

その後、`terraform` ディレクトリに移動して、 `terraform` を実行します。

```shell
cd <env>/
terraform init
terraform apply
```
