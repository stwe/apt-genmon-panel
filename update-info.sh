LANG=C apt-get dist-upgrade -s |grep -P '^\d+ upgraded'|cut -d" " -f1
