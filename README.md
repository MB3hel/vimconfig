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


Next, install the `vim-plug` plugin manager using the following command

```sh
# Unix
curl -fLo ~/.config/nvim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Windows (powershell)
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni $Env:LOCALAPPDATA\nvim\autoload\plug.vim -Force
```

After cloning open nvim and run `:PlugInstall` to install plugins. This can be done by running vim (just ignore errors on startup from loading the vimrc). Then run `:PlugInstall`. Alternatively, execute `nvim +PlugInstall`. After running PlugInstall the errors while opening vim should go away.


