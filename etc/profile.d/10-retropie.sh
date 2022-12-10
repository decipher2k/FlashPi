# launch our autostart apps (if we are on the correct tty)
if [ "`tty`" = "/dev/tty1" ] && [ "$USER" = "pi" ]; then
#  bash "/opt/retropie/configs/all/autostart.sh"
#joy2key -rawconsole -axis 105 106 103 108 -buttons 28 57 -dev /dev/input/js0  -rcfile /home/pi/.joy2keyrc &
export scriptdir="$HOME/RetroPie-Setup" && source "$HOME/RetroPie-Setup/scriptmodules/helpers.sh" && joy2keyStart
#/opt/retropie/supplementary/runcommand/joy2key.py /dev/input/js0 kcub1 kcuf1 kcuu1 kcud1 0x0a 0x20
/home/pi/run.sh
fi
