#!/usr/bin/env python3
# -*- coding: utf-8 -*-
# Copyright (C) 2017 ihs

"""  # FIXME: """

from foglamp.common.process import FoglampProcess

import foglamp.plugins.storage.postgres.backup_restore.backup_postgres as backup_postgres


class TestBackupFoglampProcess(FoglampProcess):
    """  # FIXME: """

    def __init__(self):

        super().__init__()

    def run(self):
        """  # FIXME: """

        pass


if __name__ == "__main__":

    itest_foglamp_process = TestBackupFoglampProcess()

    # noinspection PyProtectedMember
    itest_backup = backup_postgres.Backup(itest_foglamp_process._storage)

    # Retrieves all the information
    backup_information = itest_backup.get_all_backups(999, 0, None)

    for row in backup_information:
        print("Backup Information |{0}|".format(row))

    # Executes a backup
    exit_status = itest_backup.create_backup()
    print("Info |{0}|".format(exit_status))

    # Retrieves all the information
    backup_information = itest_backup.get_all_backups(999, 0, None)

    for row in backup_information:
        print("Backup Information |{0}|".format(row))
