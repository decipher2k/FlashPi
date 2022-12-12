# FlashPi
 An ultra fast booting Retroflag GPI Image - Gameboy only<br><br>
FlashPi uses a striped down and optimized RetroPi image based on the SupremeTeam release, Gnuboy as the emulator, and a custom shell based menu.<br>
Boot time with a slow sd card is about 40-50 seconds.<br>
The boot time can be reduced to to about 20-30 seconds by using a microSDXC UHS-I card.<br><br>

<b>Usage:</b> <br>
-The rom files have got to be put into the directory /home/pi/roms<br>
-Exit emu: left shoulder button<br>
-Save game state: Y button (feature not yet implemented)<br>
-Load game state: X button (feature not yet implemented)<br>
<br><br>
<br>
<b>Caveats:</b><br>
-You have to manually edit wpa_supplicant.conf on /boot/ to enable networking. If you can't find it, you will manually have to creat it.<br>
-If boot time is sometimes fast and sometimes slow, it can be helpfull to disable  fsck (Filesystem check) in /boot/cmdline.txe (fsck.repair=false)<br>
-If you do only see a blinking cursor after the bootlogo has been displayed, then there a no rom files present in the /home/pi/roms directory.<br>
 You can copy them to there either using a Linux USB stick from your computer, or by using some software like Paragon Linux Filesystem for Windows.<br>
