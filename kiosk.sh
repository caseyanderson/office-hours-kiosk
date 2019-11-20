#!/bin/bash
xset s noblank
xset s off
xset -dpms

unclutter -idle 0.5 -pi &

sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' /home/pi/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' /home/pi/.config/chromium/Default/Preferences

/usr/bin/chromium-browser --noerrdialogs --disable-infobars --disk-cache-dir=/dev/null --kiosk http://localhost:5000 &

while true; do
   xdotool keydown ctrl+r; xdotool keyup ctrl+r;
   sleep 15m
done
