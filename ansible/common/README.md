# Ansible

サーバ構成を管理している Ansible のコードが管理されています。

* [Ansible のベストプラクティスガイド](https://docs.ansible.com/ansible/2.9_ja/user_guide/playbooks_best_practices.html)

## ディレクトリ構成

```plain
-- README.md
-- group_vars/
   -- all/
      -- vars
      -- vault
   -- <group>/
      -- vars
      -- vault
-- roles/
   -- <role>/
      -- tasks/
         -- main.yml
      -- templates/
         -- <template>
      -- handlers/
         -- main.yml
      -- files/
         -- <file>
      -- ...
   -- ...
-- hosts.yml
-- playbook.yml
```

## Ansible Vault

Ansible Vault によって、機密情報を暗号化しています。

### 暗号化

```bash
ansible-vault encrypt group_vars/all/vault
```

### 復号化

```bash
ansible-vault decrypt group_vars/all/vault
```

## プレイブックの実行

Ansible のプレイブックを実行するには、以下のコマンドを実行します。

```bash
ansible-playbook -i hosts.yml playbook.yml --ask-vault-pass
```
