#!/bin/bash

# ./secrets/ansible_vault.env からパスワードを取得して表示する
cat ./secrets/ansible_vault.env | grep ANSIBLE_VAULT_PASSWORD | cut -d'=' -f2 | tr -d '\n'
