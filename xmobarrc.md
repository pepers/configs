#### wireless.sh
- the script runs iwconfig, which only allows root access
- to to give access to your user, so that you can run it:
  - run the following from terminal to edit a new sudoers.d file... `sudo visudo -f /etc/sudoers.d/iwconfig`
  - add the line `user host = (root) NOPASSWD: /sbin/iwconfig`, where `user` is your user, and `host` is your host
- you may have to change any occurrance of `mlan0` in the script to your own network interface
