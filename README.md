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

    make <aem62|aem63|aem64>-<start|backup|restore|clean>-<author|publish>

Start AEM 6.4 Author: (replace `aem64` with `aem63` or `aem62` accordingly)

    make aem64-start-author

First start will take a while due to AEM initialising `crx-quickstart` under `workspaces/aem64/author` directory.

Take a backup of AEM 6.4 Author `crx-quickstart`:

    make aem64-backup-author

This will copy the everything under `workspaces/aem64/author/crx-quickstart` into `workspaces/aem64/author/backup`.

It's recommended to take a backup after the first start so you can restore a fresh AEM installation without going through the slow initialisation process.

Restore AEM 6.4 Author from backup:

    make aem64-restore-author

And clean up AEM 6.4 Author `crx-quickstart` and backup:

    make aem64-clean-author
