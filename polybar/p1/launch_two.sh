#!/usr/bin/env bash

# Terminate already running bar instances
killall -q polybar
# If all your bars have ipc enabled, you can also use 
# polybar-msg cmd quit

DIR="/home/zura/.config/polybar"
# Launch bar1 
echo "---" | tee -a /tmp/polybar_two_1.log 
polybar -c $DIR"/p1/config.ini.bak1" mainbar 2>&1 | tee -a /tmp/polybar_two_1.log & disown

# Launch bar bottom
echo "---" | tee -a /tmp/polybar_two_1_bottom.log 
polybar -c $DIR"/p1/config.ini.bak1" bottom 2>&1 | tee -a /tmp/polybar_two_1_bottom.log & disown

# Launch bar2
#echo "---" | tee -a /tmp/polybar_two_2.log 
#polybar external 2>&1 | tee -a /tmp/polybar_two_2.log & disown

echo "Bars launched..."
