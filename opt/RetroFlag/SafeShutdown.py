#!/usr/bin/env python3
from gpiozero import Button, LED
import os 
import time
from signal import pause

powerPin = 26 
powerenPin = 27 
hold = 1
power = LED(powerenPin)
power.on()

#functions that handle button events
def when_pressed():
  os.system("touch /home/pi/shutdown")
  os.system("chmod +w /home/pi/shutdown")
  os.system("sudo killall dialog")
  os.system("touch /home/pi/killgnuboy")
  os.system("chmod +w /home/pi/killgnuboy")
  time.sleep(3)
  os.system("sudo fbv /home/pi/shutdown.jpg &")
  os.system("sudo shutdown -P now")
   
btn = Button(powerPin, hold_time=hold)
btn.when_pressed = when_pressed
pause()
