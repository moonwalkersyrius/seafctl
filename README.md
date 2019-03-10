# seafctl
Seafile Community Edition (https://www.seafile.com/en/home/) management wrapper.

# Use
```
seafctl start
seafctl stop
seafctl restart
seafctl gc [libraryID1, libraryID2, ...]
seafctl fsck [libraryID1, libraryID2, ...]
seafctl repair [libraryID1, libraryID2, ...]
```

First three are self-explanatory. `gc` performs garbage collection, `fsck` - read-only check of libraries for corruption, `repair` - repairs any found corruption in the given libraries. If no library is specified then operation will be performed on all of the libraries on the server. `fsck` doesn't stop the server, `gc` and `repair` will automatically stop the server and restart it once they're done.

All commands employ global lock to make sure user doesn't, e.g., accidentally start the server in the middle of garbage collection. First four commands will fail immediately if the lock cannot be obtained, `fsck` and `repair` will wait for the lock to be released. The main reason for `gc` not waiting for the lock is that `fsck` and `repair` can take a very long time on very large libraries. If `gc` waits for the lock and is also scheduled to run automatically frequently enough there is a chance that there will be several instances of `gc` waiting and keeping the server unavailable.

# Requirements
* `setuidgid` command from `daemontools` package.
* Properly configured `mail` command.

# Assumptions
There is a regularly scheduled garbage collection, and it is scheduled to run through this script. Garbage collection runs often enough (for the available storage size) that it is no big deal if it is missed (in case its scheduled time is during the run of fsck or repair).

# Installation
* `sudo make install`
