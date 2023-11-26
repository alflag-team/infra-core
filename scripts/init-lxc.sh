#!/usr/bin/env bash

USERNAME="infra"
USER_UID=1000
GROUP_NAME="infra"
GROUP_GID=1000
USER_SHELL="/bin/bash"
PASSWORD="password"

# グループが存在しない場合は作成する。
getent group "$GROUP_NAME" &>/dev/null || groupadd -g "$GROUP_GID" "$GROUP_NAME"

# ユーザーを作成する。
useradd -m -u "$USER_UID" -g "$GROUP_NAME" -G "$GROUP_NAME" -s "$USER_SHELL" "$USERNAME"

# ユーザのパスワードを設定する。
echo "${USERNAME}:${PASSWORD}" | chpasswd

# ユーザーにsudo権限を付与する。
echo "${USERNAME} ALL=(ALL) NOPASSWD:ALL" >>/etc/sudoers
