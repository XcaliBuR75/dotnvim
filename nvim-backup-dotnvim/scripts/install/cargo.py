import sys
import os
import logging

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
sys.path.append(os.path.dirname(SCRIPT_DIR))

from os_common import OS

class Cargo:
    def __init__(self) -> None:
        self.os = OS()

    def install(self, packages):
        logging.info(f'Cargo: installing packages "{packages}"')
        self.os.execute(f'cargo install {packages}')

    def uninstall(self, packages):
        logging.info(f'Cargo: uninstalling packages "{packages}"')
        self.os.execute(f'cargo uninstall {packages}')
