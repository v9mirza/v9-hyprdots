#!/bin/bash
# V9-hyprdots NMTUI Theme Wrapper
# Forces NMTUI to match the Monochrome + Steel Blue aesthetic

# Define Color Palette
# root: Background
# border: Window Border
# window: Window Background
# listbox: Unselected Item
# actsellistbox: Selected Item (Steel Blue)
# button: Button
# actbutton: Active Button

export NEWT_COLORS='
root=,black
window=,black
border=lightgray,black
shadow=,black
title=lightgray,black
button=lightgray,black
actbutton=white,blue
compactbutton=lightgray,black
checkbox=lightgray,black
actcheckbox=white,blue
entry=white,black
disentry=gray,black
label=lightgray,black
listbox=lightgray,black
actlistbox=white,blue
sellistbox=white,blue
actsellistbox=white,blue
textbox=lightgray,black
acttextbox=white,black
helpline=white,blue
roottext=lightgray,black
emptyscale=gray,black
fullscale=blue,black
'

# Launch NMTUI
nmtui
