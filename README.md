# vimconfig

This repo holds my neovim configuration (init.vim)


## Installation

First clone this repository

```sh
# Unix
git clone git@github.com:MB3hel/vimconfig.git ~/.config/nvim

# Windows (powershell)
git clone git@github.com:MB3hel/vimconfig.git $Env:LOCALAPPDATA\nvim\
```

Then install plugins by running `nvim +PlugInstall`


## Updating vim-plug

*vim-plug is included in this repo now, so this is not necessary during install. This is just used to update to newer versions.*

```sh
# Unix
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Windows (powershell)
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni $Env:LOCALAPPDATA\nvim\autoload\plug.vim -Force
```

