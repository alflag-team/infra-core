#!/bin/bash

SCRIPT_NAME=$(basename "$0")
BASE_DIR="$HOME/dist/kitsunebi"

# START: common functions
Logger() {
  local log_level="$1"
  local message="$2"
  local timestamp=$(date +'%Y-%m-%d %H:%M:%S')
  echo "[$timestamp] [$log_level] - $message"
}

Load_env() {
  if [ -f "$ENV_FILE" ]; then
    source "$ENV_FILE"
  else
    Logger "ERROR" "$ENV_FILE not found"
    return 1
  fi
}

Check_env() {
  if [ -z "$hoge" ] || [ -z "$fuga" ]; then
    Logger "ERROR" "Required environment variables are not set"
    return 1
  fi
}

Check_directory_exists() {
  local dir="$1"
  if [ ! -d "$dir" ]; then
    Logger "ERROR" "Directory $dir not found"
    return 1
  fi
}

Check_file_exists() {
  local file="$1"
  if [ ! -f "$file" ]; then
    Logger "ERROR" "File $file not found"
    return 1
  fi
}

# END: common functions

Main() {
  local dir="$1"

  Logger "INFO" "=== Starting $SCRIPT_NAME ==="

  # ディレクトリが存在するか確認
  Check_directory_exists "$dir" || {
    exit 1
  }

  # ディレクトリ内の全てのディレクトリに対して処理を実行
  for dir in "$dir"/*; do
    # ディレクトリの場合のみ処理を実行
    if [ -d "$dir" ]; then
      Perform "$dir"

      # 終了コードを確認
      if [ $? -ne 0 ]; then
        Logger "ERROR" "Failed to perform $dir"
      fi

    fi
  done

  Logger "INFO" "=== Finished $SCRIPT_NAME ==="
}

Perform() {
  local dir="$1"
  local dir_name=$(basename "$dir")

  Logger "INFO" "Creating file list..."

  # ディレクトリ内の全てのjarファイルを取得
  files=$(find "$dir" -maxdepth 1 -type f -name "*.jar" -exec basename {} \;)

  # 終了コードを確認
  if [ $? -ne 0 ]; then
    Logger "ERROR" "Failed to get files in $dir"
    return 1
  fi

  # ファイルが存在しない場合は list.txt を作成
  # ファイルが存在する場合は、ファイル名、更新日時、md5 ハッシュを list.txt に保存
  if [ -z "$files" ]; then
    Logger "INFO" "No files found in $dir"
    touch "$dir/list.txt"
  else
    for file in $files; do
      # ファイルの更新日時を取得
      timestamp=$(stat -c %y "$dir/$file" | cut -d '.' -f 1)

      # ファイルのmd5ハッシュを取得
      md5=$(md5sum "$dir/$file" | cut -d ' ' -f 1)

      # ファイル名、更新日時、md5ハッシュを list.txt に保存
      echo "$file,$timestamp,$md5" >>"$dir/list.txt"
    done

    Logger "INFO" "Created $dir/list.txt"
  fi
}

Main "$BASE_DIR"
