#!/usr/bin/env bash

if [ "$#" -ne 2 ]; then
  echo "Usage: $0 <container_id> <phase>"
  exit 1
fi

CONTAINER_ID="$1"
PHASE="$2"

# User details
USER_NAME="infra"
USER_UID=1000
GROUP_NAME="infra"
GROUP_GID=1000
USER_SHELL="/bin/bash"
PASSWORD="password"

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

# Function for pre-start actions
pre_start_actions() {
  log "Executing pre-start actions..."
  # Add your pre-start actions here
}

# Function for post-start actions
post_start_actions() {
  log "Executing post-start actions..."

  # Check if the group already exists
  if ! group_exists "$GROUP_NAME"; then
    lxc-attach -n "$CONTAINER_ID" -- groupadd -g "$GROUP_GID" "$GROUP_NAME"
  else
    log "Group $GROUP_NAME already exists. Skipping group creation."
  fi

  # Check if the user already exists
  if ! user_exists "$USER_NAME"; then
    lxc-attach -n "$CONTAINER_ID" -- useradd -m -u "$USER_UID" -g "$GROUP_NAME" -G sudo -s "$USER_SHELL" "$USER_NAME"
    lxc-attach -n "$CONTAINER_ID" -- echo "${USER_NAME}:${PASSWORD}" | chpasswd
  else
    log "User $USER_NAME already exists. Skipping user creation."
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
