FROM alpine

RUN apk update && apk upgrade

RUN apk add ffmpeg bash tzdata font-dejavu

RUN mkdir /data
RUN touch /var/log/cron.log
RUN touch /record.pid
RUN touch /record.out

COPY cronjobs /etc/crontabs/root
COPY ./sh/ ./sh/
COPY ./entrypoint.sh .

RUN chmod +x entrypoint.sh


# CMD ["crond", "-f", "-d", "8"]

ENTRYPOINT ["/entrypoint.sh" ]
