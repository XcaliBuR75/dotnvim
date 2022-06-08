#!/usr/bin/env python3

import shlex
from subprocess import Popen, PIPE
from typing import Optional


class OS:
    def execute(self, statement: str, pipe_stdin: bool = False) -> Popen[str]:
        commands = self.__parse_shell_command(statement)

        last_process: Optional[Popen[str]] = None
        pipe_stdin = 

        for command in commands:
            if command == commands[-1]:
                last_process = self.__execute(
                    command, False, False, last_process)
            else:
                last_process = self.__execute(
                    command, True, False, last_process)

        if last_process is None:
            raise Exception('last process is none')

        return last_process

    def __execute(self, command: list[str], pipe_stdout: bool, pipe_stdin: bool,
                  last_process) -> Popen[str]:
        params = {}

        if pipe_stdout:
            params['stdout'] = PIPE

        if pipe_stdin:
            params['stdin'] = PIPE
        elif last_process is not None:
            params['stdin'] = last_process.stdout

        return Popen(command, **params)

    def __parse_shell_command(self, statement: str) -> list[list[str]]:
        splitted_command = statement.split('|')
        commands = []

        for command in splitted_command:
            commands.append(shlex.split(command.strip()))

        return commands
