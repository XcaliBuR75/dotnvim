#!/usr/bin/env python3

import sys
import os
import logging

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
sys.path.append(os.path.dirname(SCRIPT_DIR))

from os_common import OS


class Yarn:
    def __init__(self):
        self.os = OS()

    def install(self, packages: str):
        logging.info(f'Yarn: installing packages "{packages}"')
        self.os.execute(f'yarn global add {packages}')
        
    def unlnstall(self, packages: str):
        logging.info(f'Yarn: uninstalling packages "{packages}"')
        self.os.execute(f'yarn global remove {packages}')
