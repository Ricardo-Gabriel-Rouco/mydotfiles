#!/usr/bin/env bash
IFACE=$(ip route get 1 | awk '{print $5; exit}')
[[ -z "$IFACE" ]] && echo '{"text": "⛔", "tooltip": "No interface"}' && exit 0

read rx1 tx1 < <(awk -v iface="$IFACE" '$1 ~ iface":" {print $2, $10}' /proc/net/dev)
sleep 1
read rx2 tx2 < <(awk -v iface="$IFACE" '$1 ~ iface":" {print $2, $10}' /proc/net/dev)

rx_bytes=$((rx2 - rx1))
tx_bytes=$((tx2 - tx1))

fmt() {
    local bytes=$1
    if ((bytes > 1048576)); then
        echo "$(awk "BEGIN {printf \"%.1f\", $bytes/1048576}") MB/s"
    elif ((bytes > 1024)); then
        echo "$(awk "BEGIN {printf \"%.0f\", $bytes/1024}") KB/s"
    else
        echo "${bytes} B/s"
    fi
}

down=$(fmt $rx_bytes)
up=$(fmt $tx_bytes)

echo "{\"text\": \"⬇$down ⬆$up\", \"tooltip\": \"$IFACE — RX: $down | TX: $up\"}"
