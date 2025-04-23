#!/bin/bash
# shLight.sh Created: 02/17/2025 Updated: 04/22/2025
# Robert W. Eckert - rweckert@gmail.com
#        .__    .____    .__       .__     __   
#   _____|  |__ |    |   |__| ____ |  |___/  |_ 
#  /  ___/  |  \|    |   |  |/ ___\|  |  \   __\
#  \___ \|   Y  \    |___|  / /_/  )   Y  \  |  
# /____  >___|  /_______ \__\___  /|___|  /__|  
#      \/     \/        \/ /_____/      \/ v1.4
# Useful source syntax highlighting front-end GUI utility.

fcall="export -f"
bcall="bash -c"
afp=$(dirname "$(realpath "$0")")
export app="$afp/shLight.sh"
export td="/tmp"
export tf="$td/shLight.txt"
export tt="$td/shLight.tmp"
export ti="$td/shLight.ini"
export th="$td/shLight.html"
export tl="$td/shLight-Languages.txt"
export tm="$td/shLight-Multiple.txt"
export tc="$td/shLight-Converted.txt"

# Main Menu: ===========================
function mMenu {
yad --form --css="$tp" --posx=20 --posy=20 --fixed --title="shLight-Menu" --name="mMenu" --window-icon="text-x-script" --f1-action="$app mHelp" --no-buttons --columns=8 \
--field "Convert":fbtn "$bcall mConvert" \
--field="Multiple":fbtn "$bcall mMultiple" \
--field="View":fbtn "$bcall vResult" \
--field="Languages":fbtn "$bcall vLanguage" \
--field="Options":fbtn "$bcall mTheme" \
--field="Exit":fbtn "$bcall mExit" 2> /dev/null
}
$fcall mMenu

# Convert Menu: ========================
function mConvert {
cs='@sh -c "echo %1,%2,%3,%4,%5,%6,%7 > $tf & $app cValidate"'
st=$(echo "sh,bat,c,cs,css,html,ini,java,javascript,json,log,perl,php,py,ruby,sql,vbs,xhtml")
ss=$(echo "default,mono,mono-alt,acid,berries-dark,berries-light,bipolar,blacknblue,bright,contrast,darkblue,darkness,desert,dull,easter,emacs,golden,greenlcd,ide-anjuta,ide-codewarrior,ide-devcpp,ide-eclipse,ide-kdev,ide-msvcpp,kwrite,matlab,navy,nedit,neon,night,pablo,peachpuff,print,rand01,the,typical,vampire,vim,vim-dark,whatis,whitengrey,zellner")
yad --form --css="$tp" --posx=20 --posy=115 --width=150 --title="shLight-Convert" --name="mConvert" --window-icon="text-x-script" --f1-action="$app mHelp" --separator="," --item-separator="," --fixed --no-buttons --columns=1 \
--field="Source File:FL" "$sf" \
--field="Language:CBE" "$st" \
--field="Output Folder:DIR" "" \
--field="Output File:" "" \
--field="Output Title:" "" \
--field="Line Numbering:CHK" "False" \
--field="Syntax Style:CBE" "$ss" \
--field="Covert Source":fbtn "$cs" \
--field="Close Convert":fbtn "wmctrl -c 'shLight-Convert'"
}
$fcall mConvert

# Convert Validate: ====================
function cValidate {
si=$(cat $tf | awk 'BEGIN {FS="," } { print $1 }')
st=$(cat $tf | awk 'BEGIN {FS="," } { print $2 }')
od=$(cat $tf | awk 'BEGIN {FS="," } { print $3 }')
of=$(cat $tf | awk 'BEGIN {FS="," } { print $4 }')
ot=$(cat $tf | awk 'BEGIN {FS="," } { print $5 }')
ln=$(cat $tf | awk 'BEGIN {FS="," } { print $6 }')
ss=$(cat $tf | awk 'BEGIN {FS="," } { print $7 }')
if [ -z "$si" ]; then yad --text="Please select a file to convert." --css="$tp" --title="Info" --window-icon="dialog-info" --center --text-align=left --fixed --on-top --button="OK":0; return 1; fi
if [ -z "$od" ]; then yad --text="Please select a output directory for conversion." --css="$tp" --title="Info" --window-icon="dialog-info" --center --text-align=left --fixed --on-top --button="OK":0 return 1; fi
if [ -z "$st" ]; then
yad --text="Please select the language of the source file for conversion." --css="$tp" --title="Info" --window-icon="dialog-info" --center --text-align=left --fixed --on-top --button="OK":0; return 1; fi
if [ -z "$of" ]; then yad --text="Please provide a output file for conversion." --css="$tp" --title="Info" --window-icon="dialog-info" --center --text-align=left --fixed --on-top --button="OK":0; return 1; fi
if [ -z "$st" ]; then yad --text="Please select a style for the output file." --css="$tp" --title="Info" --window-icon="dialog-info" --center --text-align=left --fixed --on-top --button="OK":0; return 1; fi
pConvert
}
$fcall cValidate

# mMultiple Menu: ======================
function mMultiple {
cm='@sh -c "echo %1@%2@%3@%4@%5 > $tf & $app mValidate"'
st=$(echo "sh,bat,c,cs,css,html,ini,java,javascript,json,log,perl,php,py,ruby,sql,vbs,xhtml")
ss=$(echo "default,mono,mono-alt,acid,berries-dark,berries-light,bipolar,blacknblue,bright,contrast,darkblue,darkness,desert,dull,easter,emacs,golden,greenlcd,ide-anjuta,ide-codewarrior,ide-devcpp,ide-eclipse,ide-kdev,ide-msvcpp,kwrite,matlab,navy,nedit,neon,night,pablo,peachpuff,print,rand01,the,typical,vampire,vim,vim-dark,whatis,whitengrey,zellner")
yad --form --css="$tp" --posx=20 --posy=115 --width=150 --title="shLight-Multiple" --name="mMultiple" --window-icon="text-x-script" --f1-action="$app mHelp" --separator="," --item-separator="," --fixed --no-buttons --columns=1 \
--field="Source Files:MFL" "" \
--field="Language:CBE" "$st" \
--field="Output Folder:DIR" "" \
--field="Syntax Style:CBE" "$ss" \
--field="Line Numbering:CHK" "False" \
--field "Convert Multiple":fbtn "$cm" \
--field="Multiple Result List":fbtn "$app vMultiple" \
--field "Close Multiple":fbtn "wmctrl -c 'shLight-Multiple'"
}
$fcall mMultiple

# Multiple Validate: ====================
function mValidate {
sl=$(cat $tf | awk 'BEGIN {FS="@" } { print $1 }')
st=$(cat $tf | awk 'BEGIN {FS="@" } { print $2 }')
od=$(cat $tf | awk 'BEGIN {FS="@" } { print $3 }')
ss=$(cat $tf | awk 'BEGIN {FS="@" } { print $4 }')
ln=$(cat $tf | awk 'BEGIN {FS="@" } { print $5 }')
if [ -z "$sl" ]; then yad --text="Please select some files for multiple conversion." --css="$tp" --title="Info" --window-icon="dialog-info" --center --text-align=left --fixed --on-top --button="OK":0; return 1; fi
if [ -z "$st" ]; then yad --text="Please select the language of the source files for conversion." --css="$tp" --title="Info" --window-icon="dialog-info" --center --text-align=left --fixed --on-top --button="OK":0; return 1; fi
if [ -z "$od" ]; then yad --text="Please select a output directory for multiple conversion." --css="$tp" --title="Info" --window-icon="dialog-info" --center --text-align=left --fixed --on-top --button="OK":0 return 1; fi
if [ -z "$ss" ]; then yad --text="Please select a style for the output files." --css="$tp" --title="Info" --window-icon="dialog-info" --center --text-align=left --fixed --on-top --button="OK":0; return 1; fi
pMultiple
}
$fcall mValidate

# Process Convert: =====================
function pConvert {
si=$(cat $tf | awk 'BEGIN {FS="," } { print $1 }')
st=$(cat $tf | awk 'BEGIN {FS="," } { print $2 }')
od=$(cat $tf | awk 'BEGIN {FS="," } { print $3 }')
of=$(cat $tf | awk 'BEGIN {FS="," } { print $4 }')
ot=$(cat $tf | awk 'BEGIN {FS="," } { print $5 }')
ln=$(cat $tf | awk 'BEGIN {FS="," } { print $6 }')
ss=$(cat $tf | awk 'BEGIN {FS="," } { print $7 }')
if [ "$ss" == "default" ] || [ "$ss" == "mono" ] || [ "$ss" == "mono-alt" ] ; then
ts="$ss.css"
else
ts="sh_$ss.css"
fi
if [[ "$ln" == "TRUE" ]]; then
source-highlight --title="$ot" --src-lang="$st" --line-number -i "$si" -o "$od/$of" --style-css-file="/usr/share/source-highlight/$ts"
fi
if [[ "$ln" == "FALSE" ]]; then
source-highlight --title="$ot" --src-lang="$st" -i "$si" -o "$od/$of" --style-css-file="/usr/share/source-highlight/$ts"
fi
vResult
}
$fcall pConvert

# Process Multiple: ====================
function pMultiple {
sl=$(cat $tf | awk 'BEGIN {FS="@" } { print $1 }')
st=$(cat $tf | awk 'BEGIN {FS="@" } { print $2 }')
od=$(cat $tf | awk 'BEGIN {FS="@" } { print $3 }')
ss=$(cat $tf | awk 'BEGIN {FS="@" } { print $4 }')
ln=$(cat $tf | awk 'BEGIN {FS="@" } { print $5 }')
if [ "$ss" == "default" ] || [ "$ss" == "mono" ] || [ "$ss" == "mono-alt" ] ; then
ts="$ss.css"
else
ts="sh_$ss.css"
fi
echo "$sl" > "$tm" #$td/mList.txt
echo -n "" > "$tc" #/$td/clist.txt
sed -i 's/,/\n/g' "$tm" #$td/mList.txt
while read -r line; do
of=$(echo "${line}" | awk 'BEGIN {FS="." } { print $1 }')
pn=$(basename "$of")
fn="Source-$pn.html"
fp=$(echo "${line}")
echo "$od/$fn" >> "$tc" #$td/clist.txt
if [[ "$ln" == "TRUE" ]]; then
source-highlight --title="$of" --src-lang="$st" --line-number -i "$fp" -o "$od/$fn" --style-css-file="/usr/share/source-highlight/$ts"
fi
if [[ "$ln" == "FALSE" ]]; then
source-highlight --title="$of" --src-lang="$st" -i "$fp" -o "$od/$fn" --style-css-file="/usr/share/source-highlight/$ts"
fi
i=($i+1)
echo $i
echo "# $((i))%"
done < "$tm" | yad --progress --css="$tp" --text="Multiple Conversion in Progress" --title="Info" --window-icon="dialog-info" --pulsate --auto-close --auto-kill --on-top --center --button=yad-cancel
vMultiple
}
$fcall pMultiple

# View Multiple: =======================
function vMultiple {
od=$(cat $tf | awk 'BEGIN {FS="@" } { print $3 }')
vo='@sh -c "xdg-open %s"'
ydo=$(yad --list --css="$tp" --posx=50 --posy=160 --width=500 --height=430 --title="shLight-Multiple-List" --name="vMultiple" --window-icon="text-x-script" --f1-action="$app mHelp" --dclick-action="$vo" --button="Browse Output":3 --button="Export List":2 --button="Close List":1 --column="Converted File" < $tc)
ydo=$?
if [[ $ydo -eq 1 ]]; then wmctrl -c 'shLight-Multiple-List'; fi
if [[ $ydo -eq 2 ]]; then xdg-open "$tc"; fi
if [[ $ydo -eq 3 ]]; then xdg-open "$od"; fi
}
$fcall vMultiple

# View Result: =========================
function vResult {
od=$(cat $tf | awk 'BEGIN {FS="," } { print $3 }')
of=$(cat $tf | awk 'BEGIN {FS="," } { print $4 }')
if [ -z "$od" ]; then
yad --text="Please convert a file before viewing the converted output." --css="$tp" --title="Info" --window-icon="dialog-info" --center --text-align=left --fixed --on-top --button="OK":0 & exit
fi
ydo=$(yad --html --browser --css="$tp" --width=900 --height=500 --center --title="shLight-View" --name="vResult" --window-icon="text-x-script" --f1-action="$app mHelp" --uri="$od/$of" --file-op --button="Open Folder":4 --button="Edit Output":3 --button="Print Output":2 --button="Close Viewer":1)
ydo=$?
if [[ $ydo -eq 1 ]]; then wmctrl -c 'shLight-View'; fi
if [[ $ydo -eq 2 ]]; then
yad --print --filename="$od/$of" --center
vResult
fi
if [[ $ydo -eq 3 ]]; then
cp -f "$od/$of" "$td/shLight-Converted.txt"
xdg-open "$td/shLight-Converted.txt"
vResult
fi
if [[ $ydo -eq 4 ]]; then
xdg-open "$od"
vResult
fi
}
$fcall vResult

function vLanguage {
source-highlight --lang-list > "$tl"
sed -i 's/=/\n/g' "$tl"
ydo=$(yad --list --css="$tp" --posx=50 --posy=160 --width=500 --height=430 --title="shLight-Languages" --name="vLanguage" --window-icon="text-x-script" --f1-action="$app mHelp" --dclick-action="$cp" --button="Close":1 --column="Tag" --column="Language" < $tl)
}
$fcall vLanguage

# Menu Theme: ==========================
function mTheme {
gut='@sh -c "echo %2 > $tf & $app tUser"'
gst='@sh -c "echo %5 > $tf & $app tSystem"'
ydo=$(yad --form --css="$tp" --posx=40 --posy=135 --width=300 --fixed --title="shLight-Theme" --name="mTheme" --window-icon="text-x-script" --f1-action="$app mHelp" --button="Help":3 --button="About":2 --button="Close":1 \
--field="Custom Theme"::LBL "" \
--field="Load Theme:FL" "/usr/share/themes/" \
--field="Apply Custom Theme":fbtn "$gut" \
--field="System Default"::LBL "" \
--field="Mode:CB" "Light Theme\!Dark Theme" \
--field="Apply System Theme":fbtn "$gst" \
--field="Browse Themes Folder":fbtn "$app tBrowse" 2> /dev/null)
ydo=$?
if [[ $ydo -eq 1 ]]; then wmctrl -c 'shLight-Theme'; fi
if [[ $ydo -eq 2 ]]; then mAbout; fi
if [[ $ydo -eq 3 ]]; then mHelp; fi
}
$fcall mTheme

# User Selected Theme: =================
function tUser {
read gut < "$tf"
sed -i '/stheme:/d' $ti
echo "stheme:$gut" >> "$ti"
tApply
}
$fcall tUser

# System Theme: ========================
function tSystem {
read gst < "$tf"
if [ "$gst" = "Dark Theme" ]; then
sed -i '/stheme:/d' "$ti"
echo "stheme:/usr/share/themes/Breeze-Dark/gtk-4.0/gtk.css" >> "$ti"
fi
if [ "$gst" = "Light Theme" ]; then
sed -i '/stheme:/d' "$ti"
echo "stheme:/usr/share/themes/Breeze/gtk-4.0/gtk.css" >> "$ti"
fi
tApply
}
$fcall tSystem

# Apply Theme: =========================
function tApply {
stheme=$(grep "stheme" $ti | awk 'BEGIN {FS=":" } { print $2 }')
export tp="$stheme"
wmctrl -c 'shLight-Menu'
wmctrl -c 'shLight-Theme'
mMenu
}
$fcall tApply

# Browse Theme: ========================
function tBrowse {
xdg-open "/usr/share/themes/"
}
$fcall tBrowse

# Main Help: ===========================
function mHelp {
yad --html --browser --css="$tp" --width=900 --height=500 --posx=20 --posy=115 --title="shLight-Documentation" --name="mHelp" --window-icon="text-html" --uri="https://github.com/rweckert/shLight/blob/eb9adcd52785eb3b45819bf4b3425e3b608ce847/README.md" --file-op
}
$fcall mHelp

# About ================================
function mAbout {
yad --about --css="$tp" \
--window-icon="text-x-script" \
--image="text-x-script" \
--authors="Robert W Eckert - rweckert@gmail.com" \
--license="GPL3" \
--comments="Useful source syntax highlighting front-end GUI utility." \
--copyright="Updated 04/22/2025 by Robert W Eckert" \
--pversion="Version: 1.4" \
--pname="shLight" \
--button="Close!gtk-close":1
}
$fcall mAbout

# Load Menu: ===========================
function mLoad {
if test -f "$ti"; then
stheme=$(grep "stheme" $ti | awk 'BEGIN {FS=":" } { print $2 }')
export tp="$stheme"
mMenu
else
export tp=""
mMenu
fi
}
$fcall mLoad

# Exit and Cleanup =====================
function mExit {
wmctrl -c 'shLight-Menu'
wmctrl -c 'shLight-Convert'
wmctrl -c 'shLight-Multiple'
wmctrl -c 'shLight-Multiple-List'
wmctrl -c 'shLight-View'
wmctrl -c 'shLight-Languages'
wmctrl -c 'shLight-Theme'
wmctrl -c 'shLight-Documentation'
rm -f "$td/shLight-Converted.txt"
rm -f "$th"
rm -f "$tf"
rm -f "$tt"
rm -f "$tl"
rm -f "$tm"
rm -f "$tc"
exit
}
$fcall mExit

if [ -z "$1" ]; then mLoad; else $1; fi
