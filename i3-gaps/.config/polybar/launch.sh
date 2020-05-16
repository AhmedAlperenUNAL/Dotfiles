#!/bin/sh

# Terminate Already Running Bar Instances
killall -q polybar

# Wait Until The Processes Have Been Shut Down
while pgrep -u $UID -x polybar >/dev/null; do 
    sleep 1;
done

# Launch Bar
polybar -r topbar
