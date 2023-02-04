# add the following line in your sudoers
# username ALL=(ALL) NOPASSWD:/usr/bin/apt update

# be sure, the Tango Theme is available in /usr/share/icons

LAST=$(date +%T)

readonly DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
#readonly U=$(sudo apt update 2>/dev/null)
readonly O=$(LANG=C apt-get dist-upgrade -s |grep -P '^\d+ upgraded'|cut -d" " -f1)

if [ "$O" = "0" ]; then
    Z0="<img>/usr/share/icons/Tango/16x16/apps/system-software-update.png</img>"
    echo -e "${Z0}<txt> Your system is up to date.</txt>"
else
    AVAIL="<img>/usr/share/icons/Tango/16x16/status/software-update-urgent.png</img>"
    echo -e "${AVAIL}<txt> $O updates available.</txt><click>exo-open --launch TerminalEmulator sudo apt dist-upgrade</click>"
fi

MORE_INFO="<tool>Last time checked for updates: $LAST</tool>"
echo -e "${MORE_INFO}"
