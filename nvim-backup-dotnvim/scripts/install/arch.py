#!/usr/bin/env python3

import sys
import os

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
sys.path.append(os.path.dirname(SCRIPT_DIR))

from git import Git
from pacman import Pacman
from cargo import Cargo
from node_yarn import Yarn
from python_pip import PIP

class NeovimInstaller:
    def __init__(self) -> None:
        self.pacman = Pacman()
        self.pip = PIP()
        self.yarn = Yarn()
        self.cargo = Cargo()

    def lnstall_prerequisites(self):
        self.pacman.install('neovim python-pip nodejs yarn git cargo')
        self.pip.install('pynvim')
        self.yarn.install('prettier')
        self.cargo.install('stylua --features lua52')

        Git(cwd="~/.config/nvim", submodules=True,
            job_count=2).clone('https://github.com/s1n7ax/dotnvim.git')
