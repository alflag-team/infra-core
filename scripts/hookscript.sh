#!/usr/bin/env bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <container_id> <phase>"
  exit 1
fi

CONTAINER_ID="$1"
PHASE="$2"

# Infra user details
USER_INFRA_NAME="infra"
USER_INFRA_UID=1000
USER_INFRA_SHELL="/bin/bash"
USER_INFRA_PASSWORD="password"
GROUP_INFRA_NAME="infra"
GROUP_INFRA_GID=1000

# Ansible user details
USER_ANSIBLE_NAME="ansible"
USER_ANSIBLE_UID=1500
USER_ANSIBLE_SHELL="/bin/bash"
USER_ANSIBLE_PASSWORD="password"
GROUP_ANSIBLE_NAME="ansible"
GROUP_ANSIBLE_GID=1500

# SSH configuration
SSH_PATH="/etc/ssh/sshd_config"
SSH_CONFIG="Match Address 10.210.*.*\n\tPasswordAuthentication yes"

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

  # # Create User infra
  # ## Check if the group already exists
  # if ! group_exists "$GROUP_INFRA_NAME"; then
  #   lxc-attach -n "$CONTAINER_ID" -- groupadd -g "$GROUP_INFRA_GID" "$GROUP_INFRA_NAME"
  # else
  #   log "Group $GROUP_INFRA_NAME already exists. Skipping group creation."
  # fi

  # ## Check if the user already exists
  # if ! user_exists "$USER_INFRA_NAME"; then
  #   lxc-attach -n "$CONTAINER_ID" -- useradd -m -u "$USER_INFRA_UID" -g "$GROUP_INFRA_NAME" -G sudo -s "$USER_INFRA_SHELL" "$USER_INFRA_NAME"
  #   echo "${USER_INFRA_NAME}:${USER_INFRA_PASSWORD}" | lxc-attach -n "$CONTAINER_ID" -- chpasswd
  # else
  #   log "User $USER_INFRA_NAME already exists. Skipping user creation."
  # fi

  # Create User ansible
  ## Check if the group already exists
  if ! group_exists "$GROUP_ANSIBLE_NAME"; then
    lxc-attach -n "$CONTAINER_ID" -- groupadd -g "$GROUP_ANSIBLE_GID" "$GROUP_ANSIBLE_NAME"
  else
    log "Group $GROUP_ANSIBLE_NAME already exists. Skipping group creation."
  fi

  ## Check if the user already exists
  if ! user_exists "$USER_ANSIBLE_NAME"; then
    lxc-attach -n "$CONTAINER_ID" -- useradd -m -u "$USER_ANSIBLE_UID" -g "$GROUP_ANSIBLE_NAME" -G sudo -s "$USER_ANSIBLE_SHELL" "$USER_ANSIBLE_NAME"
    echo "${USER_ANSIBLE_NAME}:${USER_ANSIBLE_PASSWORD}" | lxc-attach -n "$CONTAINER_ID" -- chpasswd
  else
    log "User $USER_ANSIBLE_NAME already exists. Skipping user creation."
  fi

  # Configure SSH
  ## Check if the SSH configuration already exists
  if ! config_exists "$SSH_CONFIG" "$SSH_PATH"; then
    lxc-attach -n "$CONTAINER_ID" -- bash -c "echo -e '$SSH_CONFIG' >> $SSH_PATH"
    log "Appended configuration to $SSH_PATH."
  else
    log "Configuration already exists in $SSH_PATH. Skipping."
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
