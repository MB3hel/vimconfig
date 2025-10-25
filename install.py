#!/usr/bin/env python3

import os
import shutil
import platform
import urllib.request
import subprocess
import stat


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

def rmtree_force(top):
    if platform.system() == "Windows":
        for root, dirs, files in os.walk(top, topdown=False):
            for name in files:
                filename = os.path.join(root, name)
                os.chmod(filename, stat.S_IWRITE)
                os.remove(filename)
            for name in dirs:
                os.rmdir(os.path.join(root, name))
        os.rmdir(top)
    else:
        shutil.rmtree(top) 


script_dir = os.path.abspath(os.path.dirname(__file__))

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
    rmtree_force(nvim_dir)
if os.path.exists(vim_dir):
    rmtree_force(vim_dir)

# Create configs for vim
os.makedirs(vim_dir)
os.symlink(os.path.join(script_dir, "vimrc"), os.path.join(vim_dir, "vimrc"))

# Create template machine specific vimrc
machine_vimrc = os.path.join(vim_dir, "vimrc_overrides")
if not os.path.exists(machine_vimrc):
    shutil.copy(os.path.join(script_dir, "vimrc_overrides_template"), machine_vimrc)

print("Done vim.")

# Create configs for nvim
os.makedirs(nvim_dir)
os.symlink(os.path.join(script_dir, "vimrc"), os.path.join(nvim_dir, "vimrc"))
os.symlink(os.path.join(script_dir, "init.lua"), os.path.join(nvim_dir, "init.lua"))

# Setup packages for nvim
# Using vim8+ & nvim package system instead of 3rd party plugin manager
pkg_dir = os.path.join(nvim_dir, "pack", "nvim", "start")
os.makedirs(pkg_dir)
os.system(f"git clone https://github.com/neovim/nvim-lspconfig.git -b v2.3.0 {pkg_dir}/nvim-lspconfig")
os.system(f"git clone https://github.com/hrsh7th/nvim-cmp.git -b v0.0.2 {pkg_dir}/nvim-cmp")
os.system(f"git clone https://github.com/hrsh7th/cmp-nvim-lsp.git -b main {pkg_dir}/cmp-nvim-lsp")

# Symlink the machine specific vimrc so it will work for nvim as well, but
# is actually the same file as for vimrc
os.symlink(os.path.join(vim_dir, "vimrc_overrides"), os.path.join(nvim_dir, "vimrc_overrides"))

print("Done nvim.")
