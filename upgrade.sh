#!/bin/bash

readonly distUpgrade=$(exo-open --launch TerminalEmulator bash -c 'sudo apt dist-upgrade;echo "press a key";read')
xfce4-panel --plugin-event=genmon-13:refresh:bool:true
