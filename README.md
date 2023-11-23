# infra

インフラに関するコードを管理するリポジトリです。

## ディレクトリ構成

- `scripts/`: インフラに関するスクリプトを管理するディレクトリです。
- `terraform/`: Terraformのコードを管理するディレクトリです。

## デプロイ方法

`Prodmox API` のトークンを環境変数に設定します。

```shell
export PM_API_TOKEN_ID=""
export PM_API_TOKEN_SECRET=""
export ROOT_PASSWORD=""
```

その後、`terraform` ディレクトリに移動して、 `terraform` を実行します。

```shell
cd terraform
terraform init
terraform apply
```
