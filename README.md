# vimconfig

This repo holds my vim and neovim configuration

- vim setup does not use plugins and is intended to be usable in scenarios where I am unable to install plugins / neovim
- neovim is setup using plugins to add additional features

Init files:

- `vimrc` is loaded by vim and neovim
- `init.lua` is loaded by neovim only (loads `vimrc`)

Many functions are available that can be called from a `.lvimrc` file in a 
project directory (`:source .lvimrc`)

## Versions

- nvim 0.11.0+
- vim (probably any recentish version)

## Installation

Run install.py

```sh
cd ~
git clone git@github.com:MB3hel/vimconfig.git .vimconfig
cd ~/.vimconfig
python3 install.py
```

Running the install script will create symlinks to the correct files (requires admin or developer mode on windows).

## Updates

```sh
cd ~/.vimconfig
git pull
python3 install.py
```

## Example .lvimrc commands

```sh
# Available in nvim only
lua start_lsp_clangd({"--header-insertion=never"})
lua start_lsp_pyright({})

# Available in vim & nvim
:set cc=120
:IntentTabs(4)
:IntentSpaces(4)
```
