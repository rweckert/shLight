# <img align="left" width="48" src="Icon-shLight.png" /> shLight
Useful source syntax highlighting front-end GUI utility.

### Script Purpose as a Tool:
The shLight script allows the process of converting source code of varying languages to syntax highlighted HTML documents with options of different styles. shLight allows the option to convert a single document or a batch list of documents with ease.

![shLight Screenshot](https://github.com/rweckert/shLight/blob/af6262bcf56d6997535d972369b468b43edce5cb/screenshot-shLight.jpg)

### Setup:
1. Please review "[Common System Requirements](https://github.com/rweckert/shLight/blob/main/README.md#common-system-requirements)" and "[Critical System Requirements](https://github.com/rweckert/shLight/blob/main/README.md#critical-system-requirements)" sections below for basic and critical requirements to run this script successfully.
2. Save the shLight.sh file to a directory. <br/>
3. Make the shLight.sh script executable by running the following command in the same directory as the shLight.sh file: <br/>
_chmod +x shLight.sh_

### Features:
- Convert a single document for syntax highlighting conversion. <br/>
- Convert multiple documents for syntax highlighting conversion. <br/>
- Select output folder for single or multiple syntax highlighting conversions. <br/>
- Supports over 40 different styles for syntax highlighting output. <br/>
- Supports over 170 different source language types for syntax highlighting conversion. <br/>
- Optional "Line Numbering" for output for both single or multiple syntax highlighting conversions. <br/>
- Single syntax highlighting conversion allows output to contain a document title. <br/>
- Browse output folder for both single or multiple syntax highlighting conversions. <br/>
- Use the 'F1' key for documentation from any main window. <br/>

### Typical Usage:
When opening shLight select either the option for "Convert" to convert a source file to a HTML syntax highlighted document or "Multiple" for multiple files to be converted at once. In either option, you will be directed to a window asking for input of the file(s) of source to be converted. Options include "Source", "Language", "Output Folder", and "Syntax Style" as well as "Line Numbers". Over 170 source languages and over 40 different document styles are supported. After making selections click on the appropriate convert button to then view results ready for publishing.

### Detailed Options and Usage:
When opening the shLight script the main menu will appear with the following options: <br/>
**- Convert:** Opens the "Convert Menu" to convert a single source file. <br/>
**- Multiple:** Opens the "Convert Multiple Menu" to convert a multiple source files. <br/>
**- View:** Views the last single converted file. <br/>
**- Languages:** Displays a list of all supported code languages available for conversion. <br/>
**- Options:** Allows options for a theme to be selected for use by the scripts menus and windows. <br/>
**- Exit:** Closes the shLight script including all menus and windows.

### Convert Menu:
This option allows syntax highlight conversion of a single file, contains the following options: <br/>
**- Source File:** Select a single file for syntax highlighting conversion. <br/>
**- Language:** Select a language of the source file. If the source file language is not listed, click on the "Languages" main menu option for a complete list and type in the language needed into this field. <br/>
**- Output Folder:** Select the output folder for the syntax highlighted file. <br/>
**- Output File:** Type in a filename for the syntax highlighted convert file. <br/>
**- Output Title:** Apply a title for the syntax highlighted convert file. <br/>
**- Line Numbering:** Select if each line of the syntax highlighted convert file will be numbered. Options are "True" or "False". <br/>
**- Syntax Style:** Select the style of the syntax highlighted convert file. The option "Default" is the primary selection. <br/>
**- Convert Source:** Select this button to convert a source file using the input from the above fields. If fields used for a successful conversion are not filled a error will occur. <br/>
**- Close Convert:** Closes the "shLight Convert" window.

### View:
After a conversion of a single file this feature will display the converted syntax. These options include: <br/>
**- Open Folder:** Opens the folder that contains the output file for browsing using the systems default file management application. <br/>
**- Edit Output:** Opens the source of the converted file using the systems default text editor. <br/>
**- Print Output:** Opens the "Print Dialog window to print the output file. <br/>
**- Close Viewer:** Closes the "shLight View" window.

### Multiple:
This option allows syntax highlight conversion of multiple files at once: <br/>
**- Source Files:** Select a multiple files for syntax highlighting conversion. <br/>
**- Language:** Select a language of the source files. If the source file language is not listed, click on the "Languages" main menu option for a complete list and type in the language needed into this field. <br/>
**- Output Folder:** Select the output folder for the syntax highlighted files. <br/>
**- Syntax Style:** Select the style of the syntax highlighted convert files. The option "Default" is the primary selection. <br/>
**- Line Numbering:** Select if each line of the syntax highlighted convert files will be numbered. Options are "True" or "False". <br/>
**- Convert Multiple:** Select this button to convert multiple source files using the input from the above fields. If fields used for a successful conversion are not filled a error will occur. <br/>
**- Close Convert:** Closes the "shLight Multiple" window.

### Multiple Convert List:
Provides a list of the multiple files that have been converted. These options include: <br/>
**- Double Click:** Performing a double mouse click on a listed file that has been converted will open the users default web browser for viewing. <br/>
**- Browse Output:** Opens the folder that contains the multiple output files for browsing using the systems default file management application. <br/>
**- Export List:** Exports the list viewed to the systems default text editor. <br/>
**- Close List:** Closes the "shLight Multiple List" window.

### Languages:
This is the complete language list that is supported for conversion. If the source syntax type is not listed in the "Language" pull down menu, you can review this list of supported languages and type in the language tag value for the "Language" conversion option manually. This list is derived directly from the installed "source-highlight" package. <br/>
**- Close:** Closes the "shLight-Languages" window. <br/>

### Theme Options:
The "Theme" main menu option allows the user to change settings for the theme being used, as well as access to "Help" and "About" options: <br/>
**- Load Theme:** Allows the user to browse their system for a theme to use. <br/>
**- Apply Loaded Theme:** Applies the loaded theme. Once selected the Options window will close and re-open showing the theme selected in use. <br/>
**- Mode:** Select basic system theme available in the system for "Light Theme" or "Dark Theme". This default uses the "Breeze" theme package located in the "/usr/share/themes/" folder. <br/>
**- Apply System Theme:** Applies the Mode selected for either "Light Theme" or "Dark Theme". Once selected the Options window will close and re-open showing the theme selected in use. <br/>
**- Browse Themes Folder:** Browse the default themes folder "/usr/share/themes/". <br/>
**- Help:** Opens shLight help documentation. <br/>
**- About:** Opens the about window showing script credits. <br/>
**- Close:** Closes the "Options" window. <br/>

### Notes:
- shLight can be ran from any directory. <br/>
- shLight uses the /tmp/ folder for temporary and .ini files. <br/>
- The main menu option for "View" will display the last single highlighting conversion made. If a conversion file is not found a message will appear stating that you must first perform a conversion before viewing. <br/>
- To access a list of previous multiple conversions, select "Multiple" from the main menu and then inside the "shLight Multiple" window select "Multiple Result List".
- Creating a highlighted conversion for either single or multiple files, the fields for "Source", "Language", "Output Folder", and "Syntax Style" must be filled or a error pointing out what field was not filled will appear. <br/>
- The "Language" option from the main menu will display a list of all source languages that the installed source-highlight package supports. This is shown as a seperate list as the list being over 170 languages is too large for the menu to be usable. The "Language" pull down option for both single and multiple conversions allow a language not listed to be typed in. <br/>
- The list of over 40 different document styles available for use are directly from the installed source-highlight package. These *.css style sheet files can be found in the "/usr/share/source-highlight/" folder. <br/>
- All temporary files created by shLight are removed once the shLight script closes. <br/>
- Use the 'F1' key for documentation from any main window.

### cImage Shortcut File:
Save the following as a file named "shLight.desktop" in creating a shortcut to this utility. Update the path for "Exec" to where the script is stored: <br/>
[Desktop Entry] <br/>
Name=shLight <br/>
GenericName=shLight <br/>
Comment=Useful source syntax highlighting front-end GUI utility. <br/>
Exec=/PathToScript/shLight.sh <br/>
Type=Application <br/>
Icon=gtk-select-color <br/>
Terminal=false <br/>

### Common System Requirements:
Common shell commands found in most Linux installations are used to provide system functionalilty for this and other scripts shared from this profile. For thoroughness, these common shell commands are listed in alphabetical order with version and man page link for review: [https://github.com/rweckert/shLight/blob/750ca2bc14503ec4c84248cfff59cd52bf22f8af/README-Basic-Requirements.md](https://github.com/rweckert/shLight/blob/750ca2bc14503ec4c84248cfff59cd52bf22f8af/README-Basic-Requirements.md)

### Critical System Requirements:
Packages listed below provide the core ingredients for graphic display and desired output that enables shLight deliver output and are critical for successful execution of the the script:

| Package       | Version              | Notes         |
|     :---:     |         :---:        | :---          |
| **yad** | 14.0+ (GTK+ 3.24.41) | A tool for developing graphical user interfaces in Linux and is used by this script to generate menus and dialog windows, is written by Victor Ananjevsky. **Download:** [https://github.com/v1cont/yad](https://github.com/v1cont/yad) **Setup:** Step by step instructions are available for either Linux or Microsoft Windows Subsystem for Linux (WSL) using a Debian base: [https://github.com/rweckert/yad-14.0-Setup-From-Scratch](https://github.com/rweckert/yad-14.0-Setup-From-Scratch) |
| **source-highlight** | 3.1.9 (library: 4:1:0) | The source-highlight package is used to convert source code to syntax highlighted documents. Written by Lorenzo Bettini [http://www.lorenzobettini.it](http://www.lorenzobettini.it) More information regarding this package can be found at: [https://linux.die.net/man/1/source-highlight](https://linux.die.net/man/1/source-highlight) and also [https://www.gnu.org/software/src-highlite/](https://www.gnu.org/software/src-highlite/). |

### Closing:
Script interface written by: Robert W. Eckert - rweckert@gmail.com Please feel free to email to submit bugs, changes or requests. This script comes with absolutely no warranty. See the link for the GNU General Public License, version 3 or later listed below for further details.

---

### Project Contents:
**Project Page:** <br/>
[https://github.com/rweckert/shLight](https://github.com/rweckert/shLight) <br/>
**Source File:** <br/>
[https://github.com/rweckert/shLight/blob/5122f14ae9feba6d896d7323dbe5200fbc9fc2bf/shLight.sh](https://github.com/rweckert/shLight/blob/5122f14ae9feba6d896d7323dbe5200fbc9fc2bf/shLight.sh) <br/>
**Documentation File:** <br/>
[https://github.com/rweckert/shLight/blob/5122f14ae9feba6d896d7323dbe5200fbc9fc2bf/README.md](https://github.com/rweckert/shLight/blob/5122f14ae9feba6d896d7323dbe5200fbc9fc2bf/README.md) <br/>
**Project Screenshot:** <br/>
[https://github.com/rweckert/shLight/blob/5122f14ae9feba6d896d7323dbe5200fbc9fc2bf/screenshot-shLight.jpg](https://github.com/rweckert/shLight/blob/5122f14ae9feba6d896d7323dbe5200fbc9fc2bf/screenshot-shLight.jpg) <br/>
**Project Licensing:** <br/>
[https://github.com/rweckert/shLight/blob/5122f14ae9feba6d896d7323dbe5200fbc9fc2bf/LICENSE](https://github.com/rweckert/shLight/blob/5122f14ae9feba6d896d7323dbe5200fbc9fc2bf/LICENSE) <br/>
**GitHub Profile Page:** <br/>
[https://github.com/rweckert](https://github.com/rweckert)
