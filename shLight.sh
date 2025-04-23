#!/bin/bash
# shLight.sh Created: 02/17/2025 Updated: 02/27/2025
# Robert W. Eckert - rweckert@gmail.com
#        .__    .____    .__       .__     __   
#   _____|  |__ |    |   |__| ____ |  |___/  |_ 
#  /  ___/  |  \|    |   |  |/ ___\|  |  \   __\
#  \___ \|   Y  \    |___|  / /_/  >   Y  \  |  
# /____  >___|  /_______ \__\___  /|___|  /__|  
#      \/     \/        \/ /_____/      \/ v1.2
# Source highlighting front-end gui utility.
# source-highlight written by Lorenzo Bettini: http://www.lorenzobettini.it

bcall="bash -c"
fcall="export -f"
export app="$HOME/Scripts"
export td="$HOME/Scripts/tmp"
export opt1='@sh -c "echo %1,%2,%3,%4,%5,%6 > $td/shConvert.txt & $app/shLight.sh shConvert"'

trap "rm -f gtk.css" EXIT
cat <<EOF > gtk.css
#yad-dialog-window { color: #ffffff; background-color: #EFF0F1; border-bottom-color: #ff5733;}
#yad-dialog-window button { color: #000000; background-color: #EFF0F1; border-color: #5294E2; background-image: none; padding: 2px;}
#yad-dialog-window button:hover { color: #ffffff;; background-color: #5294E2; border-color: #5294E2; background-image: none; padding: 2px; }
#yad-dialog-label { color: #000000; background-color: #EFF0F1; border-bottom-color: #ff5733;}
#yad-form-button { color: #000000;; background-color: #EFF0F1; border-color: #5294E2;}
#yad-form-button:hover { color: #ffffff;; background-color: #5294E2; border-bottom-color: #5294E2;}
#yad-form-flabel { color: #000000; background-color: #EFF0F1; border-color: #5294E2;}
#yad-form-entry { color: #000000; background-color: #ffffff; border-color: #5294E2; caret-color: #000000;}
#yad-list-widget { color: #000000; background-color: #EFF0F1;}
#yad-list-widget:selected { color: #ffffff;; background-color: #5294E2;}
#yad-form-combo box { color: #000000; background-color: #EFF0F1; border-color: #5294E2; background-image: none;}
#yad-form-combo box button { color: #000000; background-color: #EFF0F1; border-color: #5294E2; background-image: none;}
EOF

function mMenu {
st=$(echo "bat,c,cs,css,html,ini,java,javascript,json,log,perl,php,py,ruby,sh,sql,vbs,xhtml")
yd1=$(yad --css=gtk.css --form --posx=40 --posy=40 --width=700 --title="shLight-v1.2" --name="shLight-v1.2" --window-icon="text-x-script" --separator="," --item-separator="," --no-buttons --columns=2 \
--field="Output Title" "rwebiSource-" \
--field="Input File":FL "" \
--field="Source Type:CBE" "$st" \
--field="Output Folder":MDIR "/home/rweckert/rwebi/htdocs/Source/SourceLibrary" \
--field="Output File" "rwebiSource-Item-Name-html.html" \
--field="Viewer" "falkon" \
--field "Convert Source":fbtn "$opt1" \
--field "Language List":fbtn "bash $app/shLight.sh shLanguage" \
--field "Report Details":fbtn "bash $app/shLight.sh shReport" \
--field "Options":fbtn "bash $app/shLight.sh shOptions" \
--field "About":fbtn "bash $app/shLight.sh about" \
--field="Exit":fbtn "wmctrl -c 'shLight-v1.2'")

}
$fcall mMenu

function shOptions {
yd2=$(yad --form --posx=80 --posy=80 --width=500 --title="shLight-Options" --name="shLight-Options" --window-icon="text-x-script" --separator="," --item-separator="," --no-buttons --columns=1 \
--field="Line Numbering:CHK" \
--field="Number Padding":Numeric "4" \
--field="Number Anchors:CHK" \
--field="Include Statistics:CHK" \
--field="External Stylesheet":TEXT "")
}
$fcall shOptions

function shReport {
export opt2='@sh -c "echo %1,%2,%3,%4,%5,%6 > $td/shReport.txt & wmctrl -c 'shLight-Report'"'
export opt3='@sh -c "rm -f $td/shReport.txt & wmctrl -c 'shLight-Report'"'

yd3=$(yad --form --posx=90 --posy=90 --width=500 --title="shLight-Report" --name="shLight-Report" --window-icon="text-x-script" --no-buttons --columns=1 \
--field="Source Title" "$rt" \
--field="Author(s)" "$ra" \
--field="File Name" "$rf" \
--field="Date Time" "$rd" \
--field="Version" "$rv" \
--form \
  --field="Description / Notes::TXT" "" \
--field "Export":fbtn "bash $app/shLight.sh shReportExport" \
--field "Save":fbtn "$opt2" \
--field "Remove":fbtn "$opt3" \
--field "Cancel":fbtn "wmctrl -c 'shLight-Report'")

}
$fcall shReport

function shValid {
sTitle=$(echo $ydo | awk 'BEGIN {FS="," } { print $1 }')
sInput=$(echo $ydo | awk 'BEGIN {FS="," } { print $2 }')
sType=$(echo $ydo | awk 'BEGIN {FS="," } { print $3 }')
rFolder=$(echo $ydo | awk 'BEGIN {FS="," } { print $4 }')
rFile=$(echo $ydo | awk 'BEGIN {FS="," } { print $5 }')
rViewer=$(echo $ydo | awk 'BEGIN {FS="," } { print $6 }')
rvPath="/usr/bin/"

if [ -z "$sInput" ]; then yad --text="Input File was not specified." --button="OK"
shLight; fi
if [ -z "$sType" ]; then yad --text="Source Type was not specified." --button="OK"
shLight; fi
if [ -z "$rFolder" ]; then yad --text="Output Folder was not specified." --button="OK"
shLight; fi
if [ -z "$rFile" ]; then yad --text="Output File was not specified." --button="OK"
shLight; fi

if [ -n "$sInput" ] && [ -n "$sType" ] && [ -n "$rFolder" ] && [ -n "$rFile" ]; then shProcess; fi

}
$fcall shValid

function shConvert {

yad --text-info="" < $td/shConvert.txt
read cf < $td/shConvert.txt
sTitle=$(echo $cf | awk 'BEGIN {FS="," } { print $1 }')
sInput=$(echo $cf | awk 'BEGIN {FS="," } { print $2 }')
sType=$(echo $cf | awk 'BEGIN {FS="," } { print $3 }')
rFolder=$(echo $cf | awk 'BEGIN {FS="," } { print $4 }')
rFile=$(echo $cf | awk 'BEGIN {FS="," } { print $5 }')
rViewer=$(echo $cf | awk 'BEGIN {FS="," } { print $6 }')
rvPath="/usr/bin/"

source-highlight --title="$sTitle" --src-lang="$sType" -i "$sInput" -o "$rFolder/$rFile"

if test -f "$td/shReport.txt"; then
sed -i '1s/^/<hr>\n/' $rFolder/$rFile
sed -i '1s/^/Title:\n/' $rFolder/$rFile
fi

if [ -z "$rViewer" ]; then
shComplete
else
$rvPath$rViewer "$rFolder/$rFile"
shComplete
fi
}
$fcall shConvert

function shComplete {
yad --text="shLight has prcossed source file:\n$rFolder/$rFile" --button="OK"

}
$fcall shComplete

function shExit {
echo -e "\nNo source processed. shLight was canceled."
exit 
}
$fcall shExit

function about {
yad --about \
--window-icon=gtk-about \
--image="text-x-script" \
--authors="Lorenzo Bettini: http://www.lorenzobettini.it is the aurhor of the
source-highlight program Copyright © 1999-2008.
source-highlight 3.1.9 (library: 4:1:0) June 2019.
yad gui front-end written by: Robert W Eckert - rweckert@gmail.com" \
--license="GPL3" \
--comments="shLight is a source highlighting gui utility.
This interface relies on the program source-highlight
written by Lorenzo Bettini:
http://www.lorenzobettini.it" \
--copyright="Updated 02/27/2025 by Robert W Eckert" \
--pversion="Version: 1.2" \
--pname="shLight" \
--button="Close!gtk-close":1
}
$fcall about

function shLanguage {
yd3=$(yad --list --width=500 --height=400 --posx=280 --posy=160 --title="Language Reference" --name="shLanguage" --window-icon="" --no-buttons --columns=2 \
--column="Value" \
--column="Description" \
C cpp.lang \
F77 fortran.lang \
F90 fortran.lang \
H cpp.lang \
ac m4.lang \
ada ada.lang \
adb ada.lang \
am makefile.lang \
applescript applescript.lang \
asm asm.lang \
autoconf m4.lang \
awk awk.lang \
bash sh.lang \
bat bat.lang \
batch bat.lang \
bib bib.lang \
bison bison.lang \
c c.lang \
caml caml.lang \
cbl cobol.lang \
cc cpp.lang \
changelog changelog.lang \
clipper clipper.lang \
cls latex.lang \
cobol cobol.lang \
coffee coffeescript.lang \
coffeescript coffeescript.lang \
conf conf.lang \
cpp cpp.lang \
cs csharp.lang \
csh sh.lang \
csharp csharp.lang \
css css.lang \
ctp php.lang \
cxx cpp.lang \
d d.lang \
desktop desktop.lang \
diff diff.lang \
dmd d.lang \
docbook xml.lang \
dtx latex.lang \
el lisp.lang \
eps postscript.lang \
erl erlang.lang \
erlang erlang.lang \
errors errors.lang \
f fortran.lang \
f77 fortran.lang \
f90 fortran.lang \
feature feature.lang \
fixed-fortran fixed-fortran.lang \
flex flex.lang \
fortran fortran.lang \
free-fortran fortran.lang \
glsl glsl.lang \
go go.lang \
groovy groovy.lang \
h cpp.lang \
haskell haskell.lang \
haxe haxe.lang \
hh cpp.lang \
hpp cpp.lang \
hs haskell.lang \
htm html.lang \
html html.lang \
hx haxe.lang \
hxx cpp.lang \
in makefile.lang \
ini desktop.lang \
ipxe ipxe.lang \
islisp islisp.lang \
java java.lang \
javalog javalog.lang \
javascript javascript.lang \
js javascript.lang \
json json.lang \
kcfg xml.lang \
kdevelop xml.lang \
kidl xml.lang \
ksh sh.lang \
l flex.lang \
lang langdef.lang \
langdef langdef.lang \
latex latex.lang \
ldap ldap.lang \
ldif ldap.lang \
lex flex.lang \
lgt logtalk.lang \
lhs haskell_literate.lang \
lilypond lilypond.lang \
lisp lisp.lang \
ll flex.lang \
log log.lang \
logtalk logtalk.lang \
lsm lsm.lang \
lua lua.lang \
ly lilypond.lang \
m4 m4.lang \
makefile makefile.lang \
manifest manifest.lang \
mf manifest.lang \
ml caml.lang \
mli caml.lang \
moc cpp.lang \
opa opa.lang \
outlang outlang.lang \
oz oz.lang \
pas pascal.lang \
pascal pascal.lang \
patch diff.lang \
pc pc.lang \
perl perl.lang \
php php.lang \
php3 php.lang \
php4 php.lang \
php5 php.lang \
pkgconfig pc.lang \
pl prolog.lang \
pm perl.lang \
po po.lang \
postscript postscript.lang \
pot po.lang \
prg clipper.lang \
prolog prolog.lang \
properties properties.lang \
proto proto.lang \
protobuf proto.lang \
ps postscript.lang \
py python.lang \
python python.lang \
r r.lang \
rb ruby.lang \
rc xml.lang \
rs rust.lang \
ruby ruby.lang \
s s.lang \
scala scala.lang \
scheme scheme.lang \
scm scheme.lang \
scpt applescript.lang \
sh sh.lang \
shell sh.lang \
sig sml.lang \
sl slang.lang \
slang slang.lang \
slsh slang.lang \
sml sml.lang \
spec spec.lang \
sql sql.lang \
sty latex.lang \
style style.lang \
syslog log.lang \
tcl tcl.lang \
tcsh sh.lang \
tex latex.lang \
texi texinfo.lang \
texinfo texinfo.lang \
tk tcl.lang \
tml tml.lang \
txt nohilite.lang \
ui xml.lang \
upc upc.lang \
vala vala.lang \
vbs vbscript.lang \
vbscript vbscript.lang \
vim vim.lang \
xhtml xml.lang \
xml xml.lang \
xorg xorg.lang \
y bison.lang \
yacc bison.lang \
yy bison.lang \
zsh zsh.lang)
}
$fcall shLanguage

if [ -z "$1" ]; then mMenu; else $1; fi