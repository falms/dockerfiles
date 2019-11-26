FROM alpine:3.10

ARG SPEEDTEST_FILE="ookla-speedtest-1.0.0-x86_64-linux.tgz"

ENV ZBX_SERVER=""
ENV HOSTNAME=""
ENV SPEEDTEST_SERVER="15047"

RUN apk add --no-cache jq zabbix-utils
RUN wget -O- "https://bintray.com/ookla/download/download_file?file_path=${SPEEDTEST_FILE}" | tar -xzC /usr/local/bin/

COPY ["docker-entrypoint.sh", "/usr/local/bin/"]

ENTRYPOINT [ "/usr/local/bin/docker-entrypoint.sh" ]
