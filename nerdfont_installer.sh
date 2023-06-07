#!/bin/bash

HTML='/tmp/font-downloads.html'
FONT_DOWNLOADS="https://www.nerdfonts.com/font-downloads"

curl -s -raw $FONT_DOWNLOADS -o $HTML

# get font names
fonts=()
links=()
cat $HTML | grep '/assets/img/previews/.*\.svg' -o | cut -d '/' -f 5 | sed 's/Nerd Font.*\.svg//g' > /tmp/fonts.list

while IFS= read -r line; do
	# Add each item to the array
	fonts+=("$line")
done < "/tmp/fonts.list"

for ((i=1; i<=${#fonts[@]}; i++)); do
	fontname="${fonts[$i-1]}"
	# add the download link to the links array
	links+=($(cat $HTML | grep "$fontname" | grep "https://.*\.zip" -o -m 1))
	echo "$i) $fontname"
done

# font selection and download font package
echo -n "[+] Select font to be installed: "
read input
chosen=$((input-1))
# Check if number selected is within range
if (($chosen > 0 && $chosen <= 53)); then
	downloadLink=${links[$chosen]}
	tmp=${downloadLink##*/}
	font=${tmp%%.*}
	echo "[+] Installing ${font}..."
	cd /tmp && curl -sL $downloadLink -O

else
	echo "[-] Invalid selection"
	exit 1
fi

# unzip file into directory
fontdir="/home/$USER/.local/share/fonts/$font"
mkdir -p $fontdir && unzip -q /tmp/${font}.zip -d $fontdir
echo "[+] $font has been successfully installed."

# clean up
rm $HTML
rm /tmp/fonts.list
rm /tmp/${font}.zip
