#!/bin/bash

source /linux-health-monitor/path_var/varConf.sh

# defineDate
DATE=$(date "+%Y-%m-%d %H:%M:%S")

# systemCommands
CPU=$(top -bn1 | awk -F',' '/Cpu\(s\)/ {print 100 - $4}' | awk '{print $1}')
MEM=$(free | awk '/Mem/ {printf "%.2f", $3/$2 * 100}')
DISK=$(df / | awk 'NR==2 {print $5}' | sed 's/%//')

# convert to integer
CPU_INT=${CPU%.*}
MEM_INT=${MEM%.*}

# logSystemStats
echo "[$DATE] CPU:$CPU% | MEM:$MEM% | DISK:$DISK%" >> "$systemLog"

# cpuAlert
if [ "$CPU_INT" -gt "$cpuLimit" ]; then
    echo "[$DATE] ALERT: High CPU usage: $CPU%" >> "$alertLog"
fi

# memAlert
if [ "$MEM_INT" -gt "$ramLimit" ]; then
    echo "[$DATE] ALERT: High Memory usage: $MEM%" >> "$alertLog"
fi

# diskAlert
if [ "$DISK" -gt "$diskLimit" ]; then
    echo "[$DATE] ALERT: High Disk usage: $DISK%" >> "$alertLog"
fi
