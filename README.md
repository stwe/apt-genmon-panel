# Apt-Genmon-Panel

A simple script for the xfce4-genmon-plugin to show the number of current updates for a Debian system.

It is a workaround as long as the package-update-indicator doesn't work with the new Debian Bookworm. See bug: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1025907

<img src="https://github.com/stwe/apt-genmon-panel/blob/main/docs/devlog/noUpdates.png" width="201" height="49" alt="" />

<img src="https://github.com/stwe/apt-genmon-panel/blob/main/docs/devlog/update.png" width="314" height="194" alt="" />

## Installation

You just need `xfce4-panel` and `xfce4-genmon-plugin`. Also make sure that the Tango Theme is available in `/usr/share/icons`.

Clone the project in your home directory.

### Edit sudoers

Think twice if this is ok for you and then add the following line to your `sudoers`. This only affects the update of the package list. Installing and removing packages still requires entering the password.


```bash
your_username ALL=(ALL) NOPASSWD:/usr/bin/apt update
```

### Chmod

Make `update-info.sh` and `upgrade.sh` executable (chmod 755).


### Add a Generic Monitor

Add one Generic Monitor for `update-info.sh` and place it wherever you want.

Finally, lines 18 in `update-info.sh` and 4 in `upgrade.sh` need to be edited.

```bash
# update-info.sh

18| echo "<click>xfce4-panel --plugin-event=genmon-X:refresh:bool:true</click>"
```


```bash
# upgrade.sh

4| xfce4-panel --plugin-event=genmon-X:refresh:bool:true
```

where “genmon-X” is the widget name of the particular genmon instance. To get this name, go to the panel properties screen and on the Items tab, hover your mouse over the genmon plugin to get it's internal name.


## License

This project is licensed under the GPL-2.0 License, see [LICENSE](https://github.com/stwe/apt-genmon-panel/blob/main/LICENSE) for more information.
