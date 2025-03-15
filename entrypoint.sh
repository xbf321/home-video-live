#!/bin/bash
currentPath="$(cd "$(dirname "$0")"; pwd)"
source ${currentPath}/sh/start-record.sh

crond -b

ffmpeg -i /dev/video0 \
  -video_size 1280x720 \
  -framerate 30 \
  -vcodec libx264 \
  -preset veryfast \
  -vf "drawtext=fontsize=36:fontcolor=yellow:text='%{localtime}':x=40:y=40:fontfile=/usr/share/fonts/dejavu/DejaVuSansMono.ttf" \
  -max_delay 5000 \
  -bufsize 5000000 \
  -rtbufsize 5000000 \
  -f flv rtmp://192.168.100.1:1935/live/livestream