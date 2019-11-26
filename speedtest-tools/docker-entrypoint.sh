#!/bin/ash

set -eu

RESULT=$(speedtest --accept-license -s ${SPEEDTEST_SERVER} -f json 2>/dev/null)
if [ $? -eq 0 ]; then
    PING=$(echo "$RESULT" | jq -r '.ping.latency')
    DLSP=$(echo "$RESULT" | jq -r '.download.bandwidth * 8')
    ULSP=$(echo "$RESULT" | jq -r '.upload.bandwidth * 8')
    RURL=$(echo "$RESULT" | jq -r '.result.url')

    echo "Result: ${RURL}"

    if [ -n "$HOSTNAME" ] && [ -n "$ZBX_SERVER" ]; then
        {
            echo "$HOSTNAME speedtestping $PING";
            echo "$HOSTNAME speedtestdl $DLSP";
            echo "$HOSTNAME speedtestul $ULSP";
        } | zabbix_sender -z "$ZBX_SERVER" -i - >/dev/null
    fi
fi
