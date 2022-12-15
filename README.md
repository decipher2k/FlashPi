# FlashPi
 An ultra fast booting Retroflag GPI Image - Gameboy / Gameboy Color only<br><br>
FlashPi uses a striped down and optimized RetroPi image based on the SupremeTeam release, a patched version of Gnuboy as the emulator, and a custom shell based menu.<br>
The boot time can be reduced to about 20 seconds by using a microSDXC UHS-I card.<br><br>

<b>Usage:</b> <br>
-The rom files have got to be put into the directory /home/pi/roms<br>
-Exit emu: left shoulder button<br>
-Save game state: Y button (feature not yet implemented)<br>
-Load game state: X button (feature not yet implemented)<br>
<br><br>
v1.2<br>
-Moved ROM directory to /boot (no more ext3 driver needed)<br>
-Increased size of boot partition to 1GB<br>
-Added subdirectory support<br>
-Removed requirement for file renaming<br>
-Added Gameboy Color support<br>
-Reduced required time for booting to 20s<br><br>
<b>Caveats:</b><br>
-If you do only see a blinking cursor after the bootlogo has been displayed, then there are no rom files present in the /boot/roms directory.<br>

 
