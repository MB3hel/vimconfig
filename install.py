#!/usr/bin/env python3

import os
import shutil
import platform
import urllib.request
import subprocess


def prompt_yn(msg: str, default: str = "") -> bool:
    default = default.lower()
    while True:
        res = input("{} [{}/{}] ".format(
            msg,
            "Y" if default == "y" else "y",
            "N" if default == "n" else "n"
        )).lower()
        if res == "y":
            return True
        elif res == "n":
            return False
        elif res == "" and default == "y":
            return True
        elif res == "" and default == "n":
            return False


script_dir = os.path.dirname(__file__)

# Platform specific locations for vim & nvim configs
if platform.system() == "Windows":
    vim_dir = os.path.join(os.environ["USERPROFILE"], "vimfiles")
    nvim_dir = os.path.join(os.environ["LOCALAPPDATA"], "nvim")
else:
    vim_dir = os.path.join(os.environ["HOME"], ".vim")
    nvim_dir = os.path.join(os.environ["HOME"], ".config", "nvim")

# Pre-check
print("This script will delete the following directories.")
print("  {}".format(vim_dir))
print("  {}".format(nvim_dir))
if not prompt_yn("Continue?", "n"):
    print("Aborted.")
    exit(1)

# Remove current configs
if os.path.exists(nvim_dir):
    shutil.rmtree(nvim_dir)
if os.path.exists(vim_dir):
    shutil.rmtree(vim_dir)

# Create configs for vim
os.makedirs(vim_dir)
os.symlink(os.path.join(script_dir, "vimrc"), os.path.join(vim_dir, "vimrc"))
print("Done vim.")

# Create configs for nvim
os.makedirs(nvim_dir)
os.symlink(os.path.join(script_dir, "vimrc"), os.path.join(nvim_dir, "vimrc"))
os.symlink(os.path.join(script_dir, "init.lua"), os.path.join(nvim_dir, "init.lua"))
os.makedirs(os.path.join(nvim_dir, "autoload"))
urllib.request.urlretrieve("https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim", 
                           os.path.join(nvim_dir, "autoload", "plug.vim"))
subprocess.run(["nvim", "+PlugUpdate", "+qa"])
print("Done nvim.")
