# add the following line in your sudoers
# username ALL=(ALL) NOPASSWD:/usr/bin/apt update

# be sure, the Tango Theme is available in /usr/share/icons

LAST=$(date +%T)

readonly DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
readonly U=$(sudo apt update 2>/dev/null)
readonly SIMULATION=$(LANG=C apt-get dist-upgrade -s |grep -P '^\d+ upgraded'|cut -d" " -f1)

if [ "$SIMULATION" = "0" ]; then
    # no updates available
    Z0="<img>/usr/share/icons/Tango/16x16/apps/system-software-update.png</img>"
    echo -e "${Z0}<txt> Your system is up to date.</txt>"

    MORE_INFO="<tool>Last time checked for updates: $LAST\n <span foreground='#00FF00'>Click on the icon to update the package information.</span></tool>"
    echo -e "${MORE_INFO}"
    echo -e "<click>exo-open --launch TerminalEmulator sudo apt update</click>"
else
    # system needs to be updated
    AVAIL="<img>/usr/share/icons/Tango/16x16/status/software-update-urgent.png</img>"
    echo -e "<tool><span foreground='#FF0000'>Click on the icon to update the system.</span></tool>"
    echo -e "${AVAIL}<txt> $SIMULATION updates available.</txt><click>exo-open --launch TerminalEmulator sudo apt dist-upgrade && "$U" && "$SIMULATION"</click>"
fi
