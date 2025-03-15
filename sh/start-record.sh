#!/bin/bash

FILE_NAME=$(date -I).mp4
PID_FILE="record.pid"
OUT_FILE="record.out"

kill `cat /${PID_FILE}`

sleep 10

# 删除前一天视频，只保留一天数据
find /data/ -name "*.mp4" -type f -mtime +0 | xargs rm -f

echo "start copy"

# Start Record
ffmpeg -i rtmp://192.168.100.1:1935/live/livestream -f mp4 -c copy -y /data/${FILE_NAME} > "/${OUT_FILE}" 2>&1 & echo $! > "/${PID_FILE}"
