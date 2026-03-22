#!/bin/bash

# definePath
logDir="/linux-health-monitor/logs"

# handleIf_LOGDIR_notExists
if [ ! -d "$logDir" ]; then
    mkdir -p "$logDir"
fi

# log files
systemLog="$logDir/system.log"
alertLog="$logDir/alert.log"

# defineThreshold
cpuLimit=80
diskLimit=80
ramLimit=80

#end
