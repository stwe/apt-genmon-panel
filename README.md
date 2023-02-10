# Apt-Genmon-Panel

A simple script for the xfce4-genmon-plugin to show the number of current updates for a Debian system.

```bash
# Think twice if this is ok for you and then add the
# following line to your sudoers. This only affects the
# update of the package list. Installing and removing
# packages still requires entering the password.

your_username ALL=(ALL) NOPASSWD:/usr/bin/apt update
```

To refresh the plugin, the following command is used:

```bash
# update-info.sh

echo "<click>xfce4-panel --plugin-event=genmon-X:refresh:bool:true</click>"
```


```bash
# upgrade.sh

xfce4-panel --plugin-event=genmon-X:refresh:bool:true
```
where “genmon-X” is the widget name of the particular genmon instance. To get this name, go to the panel properties screen and on the Items tab, hover your mouse over the genmon plugin to get it's internal name.


The script is a workaround as long as the package-update-indicator doesn't work with the new Debian Bookworm. See bug: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1025907
