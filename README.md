# 推送直播流到流服务器同时把直播流转存到本地MP4文件

包含一下功能：

* 视频推流到SRS流服务器
* 视频推流的同时，把视频保存到本地
* 只在每天早上7点开始保存流数据到本地，每天晚上10点停止保存，晚上因为没有灯光，没有必要保存到视频中，同时也能减少视频体积

## Install

```bash
docker run -d \
  -e TZ=Asia/Shanghai \
  -v /opt/x/web/home-video-live:/data \
  --privileged  \
  --restart unless-stopped \
  --device /dev/video0 \
  --name ffmpeg2rtmp xbf321/home-video-live
```

## Development

```
docker build  -t xbf321/home-video-live .

docker run -it --rm -e TZ=Asia/Shanghai  xbf321/home-video-live /bin/bash

docker exec -it ffmpeg2rtmp /bin/bash
```