function show(){
#dialog --title "Select file: (b) Launch: (a)" --fselect `cat /home/pi/choice`/ 20 20 2>/home/pi/choice

let i=0 # define counting variable
D=() # define working array
D+=("  .." "")
while read -r line; do # process file by file
    let i=$i+1
    D+=("  $line" "")
done < <( ls -d -1 */)

let i=0 # define counting variable
W=() # define working array
while read -r line; do # process file by file
    let i=$i+1
    W+=("$line" "")
done < <( ls -1 *.gb* )

FILE=$(dialog --title "ROM Files" --menu "Choose wisely, young padawan." 0 0 0 "${D[@]}" "${W[@]}" 3>&2 2>&1 1>&3) # show dialog and store output
clear

echo "$FILE" > /home/pi/choice



if [ ! -f /home/pi/shutdown ]; then

    if [[ "`cat /home/pi/choice`" == "  "* ]]; then

        dir="`cat /home/pi/choice`"
        echo $dir
        cd $dir
        show
    else      
#        FILE=$(dialog --title "ROM Files" --menu "Choose wisely, young padawan." 0 0 0 "${D[@]}" "${W[@]}" 3>&2 2>&1 1>&3) # show dialog and store output    

        if [[ "`cat /home/pi/choice`" == *".gb"* ]]; then
            /home/pi/gnuboy-1.0.4/sdlgnuboy --fullscreen=0 `cat /home/pi/choice`
            show
        else	             
                echo "/home/pi/roms" > /home/pi/choice
	            show
        fi
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
