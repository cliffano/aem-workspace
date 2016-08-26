AEM Workspace
-------------

TODO

Install
-------

Clone AEM Workspace repo:

    git clone https://github.com/cliffano/aem-workspace

Copy AEM jar and license files into the corresponding version directory.
E.g. copy `AEM_6.1_Quickstart.jar` and its corresponding `license.properties` into `6.1` .

Usage
-----

Go to version directory:

    cd <version>

Start AEM:
First start will take a while due to AEM initialising crx-quickstart, wait until it opens AEM login page using the default browser.

    make start

Stop AEM:

    CTRL+C

Take a snapshot:
It's recommended to take a snapshot after the first start so you can restore a fresh AEM installation without going through the slow initialisation process.

    make snapshot

Restore from snapshot:

    make restore

TODO: tmux setup
