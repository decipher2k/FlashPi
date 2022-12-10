function show(){
dialog --title "Select file: (b) Launch: (a)" --fselect `cat /home/pi/choice`/ 20 20 2>/home/pi/choice

if [ ! -f /home/pi/shutdown ]; then

if [[ "`cat /home/pi/choice`" == *".gb" ]]; then
/home/pi/gnuboy-1.0.4/sdlgnuboy --fullscreen=0 `cat /home/pi/choice`
show
else
	echo "/home/pi/roms" > /home/pi/choice
	show
fi
else
rm /home/pi/shutdown

fi
}
clear
cd /home/pi/roms

if [[ "`cat /home/pi/numfiles`" != "`ls *.gb | wc -l`" ]]; then
echo "Renaming files..."
for oldname in *; do newname=`echo $oldname | sed -e 's/ //g'`; mv "$oldname" "$newname" 2> /dev/null; done 
for oldname in *; do newname=`echo $oldname | sed -e 's/\!//g'`; mv "$oldname" "$newname" 2> /dev/null; done
for oldname in *; do newname=`echo $oldname | sed -e 's/\[//g'`; mv "$oldname" "$newname" 2> /dev/null; done
for oldname in *; do newname=`echo $oldname | sed -e 's/\]//g'`; mv "$oldname" "$newname" 2> /dev/null; done
for oldname in *; do newname=`echo $oldname | sed -e 's/\,//g'`; mv "$oldname" "$newname" 2> /dev/null; done
echo -n `ls *.gb | wc -l` > /home/pi/numfiles
fi

echo "/home/pi/roms/" > /home/pi/choice
rm /home/pi/killgnuboy
show
