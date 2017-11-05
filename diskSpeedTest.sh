#!/bin/bash

echo Test write speed bus=128k
rm ./largefile
dd if=/dev/zero of=./largefile bs=128k count=1024
echo Test write speed bus=1M
rm ./largefile
dd if=/dev/zero of=./largefile bs=1M count=1024

echo Test read speed bus=4k
sudo sh -c "sync && echo 3 > /proc/sys/vm/drop_caches"
dd if=./largefile of=/dev/null bs=4k
echo Test read speed bus=1M
sudo sh -c "sync && echo 3 > /proc/sys/vm/drop_caches"
dd if=./largefile of=/dev/null bs=1M
