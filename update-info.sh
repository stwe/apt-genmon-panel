#!/bin/bash

# add the following line in your sudoers
# username ALL=(ALL) NOPASSWD:/usr/bin/apt update

# be sure, the Tango Theme is available in /usr/share/icons

readonly dir="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly last=$(date +%T)
readonly u=$(sudo apt update 2>/dev/null)
readonly updates=$(LANG=C apt-get dist-upgrade -s |grep -P '^\d+ upgraded'|cut -d" " -f1)

if [ "$updates" = "0" ]; then
    # no updates available
    echo "<txt>Your system is up to date.</txt>"
    echo -e "<tool>Last time checked for updates: $last\n <span foreground='#00FF00'>Click on the icon to update the package information.</span></tool>"
    echo "<img>/usr/share/icons/Tango/16x16/apps/system-software-update.png</img>"
    echo "<click>xfce4-panel --plugin-event=genmon-13:refresh:bool:true</click>"
else
    # system needs to be updated
    readonly l=$(apt list --upgradable | column -t | awk '{print "\\n",$1"\t"$2"\t"$6}' | column -t | tr -d "]")
    echo "<txt>$updates updates available. Click on icon to update.</txt>"
    echo -e "<tool>"$l"</tool>"
    echo "<img>/usr/share/icons/Tango/16x16/status/software-update-urgent.png</img>"
    echo "<click>${dir}/upgrade.sh</click>"
fi
