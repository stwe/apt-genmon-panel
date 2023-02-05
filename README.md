# Apt-Genmon-Panel

A simple script for the xfce4-genmon-plugin to show the number of current updates for a Debian system.

```bash
# Think twice if this is ok for you and then add the
# following line to your sudoers. This only affects the
# update of the package list. Installing and removing
# packages still requires entering the password.

your_username ALL=(ALL) NOPASSWD:/usr/bin/apt update
```

The script is a workaround as long as the package-update-indicator doesn't work with the new Debian Bookworm. See bug: https://bugs.debian.org/cgi-bin/bugreport.cgi?bug=1025907
