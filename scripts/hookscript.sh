#!/usr/bin/env bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <container_id> <phase>"
  exit 1
fi

CONTAINER_ID="$1"
PHASE="$2"

# Debug log function
log() {
  echo "[$(date '+%Y-%m-%d %H:%M:%S')] [${PHASE}] $1"
}

# Function to check if a user exists
user_exists() {
  lxc-attach -n "$CONTAINER_ID" -- getent passwd "$1" &>/dev/null
}

# Function to check if a group exists
group_exists() {
  lxc-attach -n "$CONTAINER_ID" -- getent group "$1" &>/dev/null
}

# Function to check if a configuration exists in a file
config_exists() {
  lxc-attach -n "$CONTAINER_ID" -- grep -qF "$1" "$2"
}

# Function for pre-start actions
pre_start_actions() {
  log "Executing pre-start actions..."
  # Add your pre-start actions here
}

# Function for post-start actions
post_start_actions() {
  log "Executing post-start actions..."

  # Infra user details
  USER_INFRA_NAME="infra"
  USER_INFRA_UID=1000
  USER_INFRA_SHELL="/bin/bash"
  USER_INFRA_SSH_PUBKEY="ssh-ed25519 AAAAC3NzaC1lZDI1NTE5AAAAIECXPPShDyRAzNSsgLZ8nVZ4eyEcdKBpb4+vIadMWxlf"
  GROUP_INFRA_NAME="infra"
  GROUP_INFRA_GID=1000

  # Create infra group
  if ! group_exists "$GROUP_INFRA_NAME"; then
    log "Creating group: $GROUP_INFRA_NAME"

    # Create group
    lxc-attach -n "$CONTAINER_ID" -- groupadd -g "$GROUP_INFRA_GID" "$GROUP_INFRA_NAME"
  fi

  # Create infra user
  if ! user_exists "$USER_INFRA_NAME"; then
    log "Creating user: $USER_INFRA_NAME"

    # Create user
    lxc-attach -n "$CONTAINER_ID" -- useradd -m -u "$USER_INFRA_UID" -g "$GROUP_INFRA_NAME" -s "$USER_INFRA_SHELL" "$USER_INFRA_NAME"

    # Add SSH public key to infra user
    log "Adding SSH public key to user: $USER_INFRA_NAME"
    lxc-attach -n "$CONTAINER_ID" -- mkdir -p "/home/$USER_INFRA_NAME/.ssh"
    lxc-attach -n "$CONTAINER_ID" -- touch "/home/$USER_INFRA_NAME/.ssh/authorized_keys"
    echo "$USER_INFRA_SSH_PUBKEY" | lxc-attach -n "$CONTAINER_ID" -- tee "/home/$USER_INFRA_NAME/.ssh/authorized_keys" >/dev/null
    lxc-attach -n "$CONTAINER_ID" -- chown -R "$USER_INFRA_NAME:$GROUP_INFRA_NAME" "/home/$USER_INFRA_NAME/.ssh"
    lxc-attach -n "$CONTAINER_ID" -- chmod 700 "/home/$USER_INFRA_NAME/.ssh"
    lxc-attach -n "$CONTAINER_ID" -- chmod 600 "/home/$USER_INFRA_NAME/.ssh/authorized_keys"

    # Add infra user to sudo group
    log "Adding user: $USER_INFRA_NAME to sudo group"
    lxc-attach -n "$CONTAINER_ID" -- usermod -aG sudo "$USER_INFRA_NAME"
  fi
}

# Function for pre-stop actions
pre_stop_actions() {
  log "Executing pre-stop actions..."
  # Add your pre-stop actions here
}

# Function for post-stop actions
post_stop_actions() {
  log "Executing post-stop actions..."
  # Add your post-stop actions here
}

# Check the phase and call the corresponding function
case "$PHASE" in
"pre-start") pre_start_actions ;;
"post-start") post_start_actions ;;
"pre-stop") pre_stop_actions ;;
"post-stop") post_stop_actions ;;
*)
  log "Unknown phase: $PHASE. No action taken."
  exit 0
  ;;
esac

log "Script execution completed."
