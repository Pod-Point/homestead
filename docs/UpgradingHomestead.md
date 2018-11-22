# Upgrading Homestead
This section will present the how to upgrade our custom Homestead development environment to the latest updates on the
official Homestead. 

***

**Table of Content**

* [Known Conflicting Files](#known-conflicting-files)

* [Manual Updates](#manual-updates)

* [Other Conflicting Files](#other-conflicting-files)

***

<a id="known-conflicting-files"></a>
# Known Conflicting Files

## init.sh

File location: `/init.sh`

This file's code is splitting official implementation and our custom implementation so it's easy to upgrade without
complex conflicts.

## Vagrantfile

File location: `/Vagrantfile`

The following sections are important to our implementation:

Definition of global output colours:
```
#
## Set global output colors
#
NC = "\033[0m"
RED = "\033[0;31m"
GREEN = "\033[0;32m"
```

Definition of our custom files paths:
```
homesteadYamlPath = File.join(confDir, "files", "Homestead.yaml")
homesteadJsonPath = File.join(confDir, "files", "Homestead.json")
afterScriptPath = File.join(confDir, "files", "after.sh")
aliasesPath = File.join(confDir, "files", "aliases")
```

And setting privileged access to run the `after.sh` script with `privileged: true` (`false` by default):
```
if File.exist? afterScriptPath then
    config.vm.provision "shell", path: afterScriptPath, privileged: true, keep_color: true
end
```

<a id="manual-updates"></a>
# Manual Updates

Make sure to merge manually the files listed below according to the latest of their official counter parts.

## after.sh

official version's location: `/resources/after.sh`

custom version's location: `/resources/custom/after.sh`

## Homestead.json

official version's location: `/resources/Homestead.json`

custom version's location: `/resources/custom/Homestead.json`

## Homestead.yaml

official version's location: `/resources/Homestead.yaml`

custom version's location: `/resources/custom/Homestead.yaml`


<a id="other-conflicting-files"></a>
# Other Conflicting Files

For any other conflicting file not listed above, it should be fair to think of using the latest HEAD version from the
official release (feel free to ask senior devs for confirmation ;)).
