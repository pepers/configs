# configs
collection of personal configuration files and scripts

#### List of Files (with possible extra instructions):

- **.xmonad** directory:
  - **getvolume.bash**
    - gets the volume as a percentage from amixer
  - **invaders.bash**
    - fun script to show off colours in terminal
  - **wireless.sh**
    - the script runs iwconfig, which only allows root access
    - to to give access to your user, so that you can run it:
      - run the following from terminal to edit a new sudoers.d file... `sudo visudo -f /etc/sudoers.d/iwconfig`
      - add the line `user host = (root) NOPASSWD: /sbin/iwconfig`, where `user` is your user, and `host` is your host
    - you may have to change any occurrance of `mlan0` in the script to your own network interface
  - **xmonad.hs**
    - main xmonad configuration file, spawns some of the scripts in this folder (invaders.bash)
- **.vimrc**
  - main configuration file for vim and gvim
  - plugins to install first:
    - [Pathogen](https://github.com/tpope/vim-pathogen) for installation of other plugins.
    - [Syntastic](https://github.com/scrooloose/syntastic) for syntax highlighting.
    - [NERDTree](https://github.com/scrooloose/nerdtree) to explore filesytem tree.
    - [Solarized](https://github.com/altercation/vim-colors-solarized) for the Solarized colorscheme.
    - [Vundle](https://github.com/VundleVim/Vundle.vim) for installation of other plugins ([vim-minimap](https://github.com/severin-lemaignan/vim-minimap)).
      - run `:PluginInstall` from in Vim, to install other plugins in vimrc using Vundle.
- **.xmobarrc**
  - main configuration file for xmobar, which is run from xmonad
  - runs some scripts from the .xmonad directory
