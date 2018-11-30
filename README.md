<img align="right" src="https://raw.github.com/cliffano/aem-workspace/master/avatar.jpg" alt="Avatar"/>

[![Build Status](https://img.shields.io/travis/cliffano/aem-workspace.svg)](http://travis-ci.org/cliffano/aem-workspace)
<br/>

AEM Workspace
-------------

AEM Workspace is a simple workspace area for running multiple versions of Adobe Experience Manager (AEM).
It provides convenient build targets to start AEM, to take a backup of the AEM installation, and to restore from that backup.

Install
-------

Clone AEM Workspace repo:

    git clone https://github.com/cliffano/aem-workspace

Copy AEM jar and license files into `artifacts` directory.
E.g. copy `AEM_6.4_Quickstart.jar` and its corresponding `license-aem64.properties` into `artifacts` directory.

Usage
-----

All build targets have the format:

    make <aem62|aem63|aem64|aem65>-<start|backup|restore|clean>-<author|publish>

Start AEM 6.4 Author: (replace `aem64` with `aem63` or `aem62` accordingly)

    make aem64-start-author

Each AEM version is allocated the following port numbers:

| Version | Author Port | Publish Port |
|---------|-------------|--------------|
| AEM 6.2 | 45622       | 45623        |
| AEM 6.3 | 45632       | 45633        |
| AEM 6.4 | 45642       | 45643        |
| AEM 6.5 | 45652       | 45653        |

First start will take a while due to AEM initialising `crx-quickstart` under `workspaces/aem64/author` directory.

Take a backup of AEM 6.4 Author `crx-quickstart`:

    make aem64-backup-author

This will copy the everything under `workspaces/aem64/author/crx-quickstart` into `workspaces/aem64/author/backup`.

It's recommended to take a backup after the first start so you can restore a fresh AEM installation without going through the slow initialisation process.

Restore AEM 6.4 Author from backup:

    make aem64-restore-author

And clean up AEM 6.4 Author `crx-quickstart` and backup:

    make aem64-clean-author
