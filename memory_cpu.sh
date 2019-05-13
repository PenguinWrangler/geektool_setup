#!/bin/bash

#a=$(vm_stat | awk '/Pages free/ {print $3}' | awk 'BEGIN { FS = "." }; {print $1+0}'); echo "Memory Usage:" $a MB;

#b=$(top -l 1 | grep "CPU usage" | awk '{print 100-$7;}'); echo "CPU Usage: " $b%;

top -l 1 | grep -E "^CPU"

memory=$(top -l 1 | grep -E "^Phys" | sed 's#15G used##' |sed 's#16G used##'  | sed 's#(##' | sed 's#)##' | sed 's#wired##' | sed 's/,.*//' | sed 's#PhysMem:##')

echo Memory Usage: $memory