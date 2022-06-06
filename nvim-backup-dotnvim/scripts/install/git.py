#!/usr/bin/env python3

import sys
import os

SCRIPT_DIR = os.path.dirname(os.path.abspath(__file__))
sys.path.append(os.path.dirname(SCRIPT_DIR))

from os_common import OS


class Git:
    def __init__(self, cwd: str, submodules: bool, job_count: int = 0) -> None:
        self.os = OS()
        self.cwd = cwd
        self.submodules = submodules
        self.job_count = job_count

    def __cd(self, location) -> None:
        self.os.execute(f'cd {location}')

    def clone(self, url):
        self.__cd(self.cwd)

        cmd = 'git clone'

        if self.submodules:
            cmd = f'{cmd} --recurse-submodules'

        if self.job_count > 0:
            cmd = f'{cmd} -j {self.job_count}'

        self.os.execute(f'{cmd} {url}')
        
