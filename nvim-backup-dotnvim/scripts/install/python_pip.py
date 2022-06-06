#!/usr/bin/env python3

import sys
import os
import logging

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
sys.path.append(os.path.dirname(SCRIPT_DIR))

from os_common import OS

class PIP:
    def __init__(self) -> None:
        self.os = OS()

    def install(self, packages: str, user:bool = True):
        logging.info(f'installing packages "{packages}"')

        cmd = 'pip install --upgrade'

        if user:
            cmd  = f'{cmd} --user'
        else:
            cmd  = f'sudo {cmd}'

        self.os.execute(f'{cmd} {packages}')

    def uninstall(self, packages: str, user: bool = True):
        logging.info(f'uninstalling packages "{packages}"')

        cmd = 'pip uninstall'

        if not user:
            cmd = f'sudo {cmd}'

        self.os.execute(f'{cmd} {packages}')
