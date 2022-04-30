# vimconfig

This repo holds my vim configuration (vimrc)


## Installation

First clone this repository

```sh
# Unix
git clone git@github.com:MB3hel/vimconfig.git ~/.vim/

# Windows (powershell)
git clone git@github.com:MB3hel/vimconfig.git $HOME/vimfiles/
```


Next, install the `vim-plug` plugin manager using the following command

```sh
# Unix
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim

# Windows (powershell)
iwr -useb https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim | ni $HOME/vimfiles/autoload/plug.vim -Force
```

After cloning open vim and run `:PlugInstall` to install plugins. This can be done by running vim (just ignore errors on startup from loading the vimrc). Then run `:PlugInstall`. Alternatively, execute `vim -c ":PlugInstall"`. After running PlugInstall the errors while opening vim should go away.


