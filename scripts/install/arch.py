#!/usr/bin/env python3

import sys
import os
import logging

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
sys.path.append(os.path.dirname(SCRIPT_DIR))

from os_common import OS


class PackageManager:
    def __init__(self) -> None:
        self.os: OS = OS()

    def install(self, packages):
        logging.info(f'installing packages "{packages}"')
        self.os.execute('sudo pacman -S --noconfirm' + packages)

    def uninstall(self, packages):
        logging.info(f'uninstalling packages "{packages}"')
        self.os.execute('sudo -S pacman -S --noconfirm' + packages)

    def update_cache(self):
        logging.info('sudo updating package cache')
        self.os.execute('sudo pacman -Sy --noconfirm').communicate(input='password')

    def upgrade(self):
        logging.info('upgrading packages')
        self.os.execute('pacman -Syu --noconfirm')


def main():
    pacman = PackageManager()
    pacman.update_cache()


if __name__ == '__main__':
    main()
