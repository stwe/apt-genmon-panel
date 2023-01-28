readonly U=$(sudo apt update 2>/dev/null)
LANG=C apt-get dist-upgrade -s |grep -P '^\d+ upgraded'|cut -d" " -f1
