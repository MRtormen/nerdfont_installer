# Font Downloader
This script is a Bash script that allows you to download and install Nerd Fonts from the website Nerd Fonts. It provides a selection menu to choose the font to be installed and then automatically downloads and installs the selected font.

### Prerequisites
* Bash (Bourne Again Shell)
* curl

### Usage
1. Download the script file to your local machine.
2. Open a terminal and navigate to the directory where the script is located.
3. Make the script executable by running the following command:
```bash
chmod +x font-downloader.sh
```
4. Run the script using the following command:
```bash
    ./font-downloader.sh
```
5. The script will fetch a list of available fonts from the Nerd Fonts website and display them with corresponding numbers.
6. Enter the number of the font you want to install and press Enter.
7. The script will download and install the selected font into your user's font directory (~/.local/share/fonts).
8. Once the installation is complete, the script will display a success message.

### Notes
The script assumes that the font installation directory is ~/.local/share/fonts. If your system uses a different directory for font installations, you can modify the `FONTSDIR` variable in the script to match your system's font directory.
The script cleans up temporary files (/tmp/font-downloads.html, /tmp/fonts.list, and /tmp/${font}.zip) after the installation is complete.