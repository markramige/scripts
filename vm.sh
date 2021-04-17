#!/bin/sh 

## setup stuff, run once per vm
# sudo crontab -l | { cat; echo "*/5 * * * * /sbin/hwclock --hctosys"; } | sudo crontab -
# xfconf-query -c xfce4-keyboard-shortcuts -pn /commands/custom/\<Primary\>\<Alt\>a -t 'string' -s "sh -c '/home/mdr/bin/vm.sh'"
# mkdir -p ~/.config/autostart
# echo -e "[Desktop Entry]\nEncoding=UTF-8\nVersion=0.9.4\nType=Application\nName=vmsetup\nComment=\nExec=sh -c '/home/mdr/bin/vm.sh'\nOnlyShowIn=XFCE;\nRunHook=0\nStartupNotify=false\nTerminal=false\nHidden=false" > ~/.config/autostart/vmsetup.desktop

sleep 1
setxkbmap -model pc105 -layout us -variant , -option ctrl:nocaps
xrandr --output $(xrandr | awk '/ connected/{print $1; exit; }') --auto
