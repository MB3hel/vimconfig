#!/usr/bin/env python3

import os
import shutil
import platform
import urllib.request
import subprocess
import stat
import argparse


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
    home_dir = os.environ["USERPROFILE"]
    vim_dir = os.path.join(os.environ["USERPROFILE"], "vimfiles")
    vim_dir_tilde = "~/vimfiles"
    nvim_dir = os.path.join(os.environ["LOCALAPPDATA"], "nvim")
else:
    home_dir = os.environ["HOME"]
    vim_dir = os.path.join(os.environ["HOME"], ".vim")
    vim_dir_tilde = "~/.vim"
    nvim_dir = os.path.join(os.environ["HOME"], ".config", "nvim")


def install(offline):
    global script_dir, vim_dir, nvim_dir, nvim_plugins

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

    # Create system specific vimrc overrides ONLY if it does not already exist
    if not os.path.exists(os.path.join(home_dir, ".vimrc_overrides")):
        with open(os.path.join(home_dir, ".vimrc_overrides"), "w") as f:
            f.write("\" System specific overrides for vim & nvim go here\n")
            f.write("\" Use if has('nvim') or if !has('nvim') if needed\n")
            f.write("\n")

    # Create configs for vim
    os.makedirs(vim_dir)
    with open(os.path.join(vim_dir, "vimrc"), "w") as f:
        f.write("\" **THIS FILE IS GENERATED. DO NOT MODIFY**")
        f.write("\" Load shared vimrc\n")
        f.write("execute \"source ~/.vimconfig/vimrc\"\n")
        f.write("\n")
        f.write("\" System specific modifications\n")
        f.write("execute \"source ~/.vimrc_overrides\"\n")
        f.write("\n")

    print("Done vim.")

    # Create configs for nvim
    os.makedirs(nvim_dir)
    with open(os.path.join(nvim_dir, "init.lua"), "w") as f:
        f.write("-- **THIS FILE IS GENERATED. DO NOT MODIFY**")
        f.write("-- Load shared init.lua\n")
        f.write("vim.cmd('source ' .. vim.fn.expand('~/.vimconfig/init.lua'))\n")
        f.write("\n")
        f.write("-- Load vim's vimrc too so it applies to nvim and vim\n")
        f.write(f"vim.cmd('source ' .. vim.fn.expand('{vim_dir_tilde}/vimrc'))\n")
        f.write("\n")

    # Setup packages for nvim
    # Using vim8+ & nvim package system instead of 3rd party plugin manager
    pkg_dir = os.path.join(nvim_dir, "pack", "nvim", "start")
    
    if offline:
        # Offline install intended to be used after install.py --send remote
        # Assumes plugins direcotry exists in script dir
        # Remote machine can then install.py --offline
        shutil.copytree(os.path.join(script_dir, "copied_pkgs"), pkg_dir) 
    else:
        os.makedirs(pkg_dir)
        os.system(f"git clone https://github.com/neovim/nvim-lspconfig.git -b v2.3.0 {pkg_dir}/nvim-lspconfig")
        os.system(f"git clone https://github.com/hrsh7th/nvim-cmp.git -b v0.0.2 {pkg_dir}/nvim-cmp")
        os.system(f"git clone https://github.com/hrsh7th/cmp-nvim-lsp.git -b main {pkg_dir}/cmp-nvim-lsp")

    print("Done nvim.")


def send(remote: str):
    global script_dir, vim_dir, nvim_dir, nvim_plugins
    
    # Copy installed nvim plugins to copied_pkgs
    if os.path.exists(os.path.join(script_dir, "copied_pkgs")):
        rmtree_force(os.path.join(script_dir, "copied_pkgs"))
    shutil.copytree(os.path.join(nvim_dir, "pack", "nvim", "start"), os.path.join(script_dir, "copied_pkgs"))

    # scp entire directory to remote home folder (preserving name)
    os.system(f"scp -r {script_dir}/ {remote}:")

    # Don't just leave copied_pkgs sitting around
    rmtree_force(os.path.join(script_dir, "copied_pkgs"))

    print("You can now install.py --offline on the remote machine")


if __name__ == "__main__":
    parser = argparse.ArgumentParser()
    parser.add_argument("--offline", action="store_true", help="Offline install (use after send from another machine)")
    parser.add_argument("--send", metavar="remote", dest="remote", type=str, default=None, required=False, help="Send local installation to remote machine (scp)")
    args = parser.parse_args()
    if args.remote is not None and args.offline:
        print("Cannot use --send and --offline", file=sys.stderr)
        exit(1)

    if args.remote is not None:
        if args.remote.find(":") != -1:
            print("Do not specify path with --send remote", file=sys.stderr)
            exit(1)
        send(args.remote)
    else:
        install(args.offline)

