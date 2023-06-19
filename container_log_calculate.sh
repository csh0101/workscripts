#!/bin/bash

# Set the log file name to search for
LOG_FILE="-json.log"

# Set the directory path to search for log files
DIR_PATH="/var/lib/docker/containers"

# Initialize the total log file size to 0
TOTAL_SIZE=0

# Loop through all directories in the specified path
for dir in $DIR_PATH/*/
do
  echo "Checking directory: $dir"  # 添加调试信息，输出当前遍历的目录
  # Check if the directory contains a log file with the specified name
  if ls "$dir"*"$LOG_FILE" 1> /dev/null 2>&1
  then
    echo "Found log file: $dir$LOG_FILE"  # 添加调试信息，输出找到的日志文件路径
    # Get the size of the log file and add it to the total log file size
    SIZE=$(du -b "$dir"*"$LOG_FILE" | cut -f 1)
    TOTAL_SIZE=$((TOTAL_SIZE + SIZE))
  fi
done

# Print the total log file size in human-readable format
echo "Total size of $LOG_FILE logs in $DIR_PATH: $(numfmt --to=iec $TOTAL_SIZE)"
