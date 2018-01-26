#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Copyright (C) 2017 ihs


import sys
import time
import os
import uuid

from foglamp.services.core import server

from foglamp.common.storage_client import payload_builder
from foglamp.common.process import FoglampProcess
from foglamp.common import logger

import foglamp.plugins.storage.postgres.backup_restore.backup_postgres as backup
import foglamp.plugins.storage.postgres.backup_restore.lib as lib
import foglamp.plugins.storage.postgres.backup_restore.exceptions as exceptions

_MODULE_NAME = "test"


# Log definitions
_logger = None

_LOG_LEVEL_DEBUG = 10
_LOG_LEVEL_INFO = 20

_LOGGER_LEVEL = _LOG_LEVEL_INFO
_LOGGER_DESTINATION = logger.CONSOLE


class TestBackupProcess(FoglampProcess):
    """ # FIXME:"""

    def __init__(self):

        super().__init__()

        self._backup = backup.Backup(self._storage)

    def run(self):
        """ # FIXME:"""

        print ("ok")
        self.itest1()
        pass

    def itest1(self):
        """ # FIXME:"""

        backups = self._backup.get_all_backups(999, 0, None)

        print("backup {}".format(backups))


if __name__ == "__main__":
    _logger = logger.setup(_MODULE_NAME,
                           destination=_LOGGER_DESTINATION,
                           level=_LOGGER_LEVEL)

    itest = TestBackupProcess()

    lib._logger = _logger

    cmd = "ps -elf | grep -E '.*service.*storage.*port.*' | grep -v 'grep'  | grep -o 'port.*' | grep -o '[0-9]*'"

    _exit_code, output = lib.exec_wait(cmd, _output_capture=True, _timeout=0)
    port = output
    print("output |{}|".format(port))

    # noinspection PyProtectedMember
    print("{module} - name |{name}| - address |{addr}| - port |{port}|".format(
        module=_MODULE_NAME,
        name=itest._name,
        addr=itest._core_management_host,
        port=itest._core_management_port))


    itest.run()
