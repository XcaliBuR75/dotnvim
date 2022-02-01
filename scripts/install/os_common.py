#!/usr/bin/env python3

import shlex
from subprocess import Popen, PIPE
from typing import Optional


class OS:
    def execute(self, statement: str) -> Popen[str]:
        commands = self.__parse_shell_command(statement)

        last_process: Optional[Popen[str]] = None

        for command in commands:
            if command == commands[-1]:
                last_process = self.__execute(command, False, last_process)
            else:
                last_process = self.__execute(command, True, last_process)

        if last_process is None:
            raise Exception('last process is none')

        return last_process

    def __execute(self, command: list[str], should_pipe: bool, last_process) -> Popen[str]:
        params = {}

        if should_pipe:
            params['stdout'] = PIPE

        if last_process != None:
            params['stdin'] = last_process.stdout

        return Popen(command, **params)

    def __parse_shell_command(self, statement: str) -> list[list[str]]:
        splitted_command = statement.split('|')
        commands = []

        for command in splitted_command:
            commands.append(shlex.split(command.strip()))

        return commands
