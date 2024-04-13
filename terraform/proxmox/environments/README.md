# environments

## デプロイ方法

`Prodmox API` のトークンを環境変数に設定します。

```shell
export TF_VAR_proxmox_user=""     # Proxmoxのユーザー名
export TF_VAR_proxmox_password="" # Proxmoxのパスワード
```

その後、`terraform` ディレクトリに移動して、 `terraform` を実行します。

```shell
cd <env>/
terraform init
terraform apply
```
