# Font Downloader
Bash script that allows you to download and install Nerd Fonts from the Nerd Fonts websites. After running the scripts you can choose the font to be installed, the script will automatically download and install the selected font.

### Prerequisites
* Bash (Bourne Again Shell)
* curl

### Usage
1. Download the script file to your local machine.
2. Open a terminal and navigate to the directory where the script is located.
3. Make the script executable by running the following command:
```bash
chmod +x nerdfont_installer.sh
```
4. Run the script:
```bash
./nerdfont_installer.sh
```
5. Enter the number of the font you want to install and press Enter.
6. The script will download and install the selected font into your user's font directory (~/.local/share/fonts).
7. Done!

### Notes
The script assumes that the font installation directory is ~/.local/share/fonts. If your system uses a different directory for font installations, you can modify the `FONTSDIR` variable in the script to match your system's font directory.
The script uses temporary files (/tmp/font-downloads.html, /tmp/fonts.list, and /tmp/${font}.zip) during the installation process. This files will be cleared once the installation is complete.