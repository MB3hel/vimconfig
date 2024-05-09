# vimconfig

This repo holds my vim and neovim configuration

- vim setup does not use plugins and is intended to be usable in scenarios where I am unable to install plugins / neovim
- neovim is setup using plugins to add additional features

Init files:

- `vimrc` is loaded by vim and neovim
- `init.lua` is loaded by neovim only (loads `vimrc`)

Many functions are available that can be called from a `.lvimrc` file in a 
project directory (`:source .lvimrc`)

## Installation

```sh
git clone git@github.com:MB3hel/vimconfig.git ~/.vimconfig
python3 install.py
```

Running the install script will create symlinks to the correct files (requires admin or developer mode on windows).

It will also run `PlugUpdate` in nvim to ensure plugins are installed and up to date.