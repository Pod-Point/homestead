#!/usr/bin/env bash

find files/* -type f -not -name ".gitkeep" -exec rm -f {} \;

if [[ -n "$1" ]]; then
    # Support official Homestead tests
    cp -rfi resources/Homestead.json ./Homestead.json

    # Our implementation
    cp -rfi resources/Homestead.json files/Homestead.json
else
    # Support official Homestead tests
    cp -rfi resources/Homestead.yaml ./Homestead.yaml

    # Our implementation
    cp -rfi resources/Homestead.yaml files/Homestead.yaml
fi

#
## Check and set needed environment variables
#

if [[ -z "${HOMESTEAD_WORKING_DIR}" ]]; then
    read -e -p "Absolute path to your main code folder: " path

    export HOMESTEAD_WORKING_DIR=${path}
fi

if [[ -z "${HOMESTEAD_VENDOR_DIR}" ]]; then
    read -e -p "Absolute path to your Homestead vendor folder: " path

    export HOMESTEAD_VENDOR_DIR=${path}
fi

#
## Support official Homestead tests
#

# Replace paths in Homestead config
sed -i "" -e "s{codeRepositoryPath}$HOMESTEAD_WORKING_DIRg" ./Homestead.yaml
sed -i "" -e "s{vendorPath}$HOMESTEAD_VENDOR_DIRg" ./Homestead.yaml

# Copy needed files
cp -rfi resources/after.sh ./after.sh
cp -rfi resources/aliases ./aliases

#
## Our implementation
#

# Replace paths in Homestead config
sed -i "" -e "s{codeRepositoryPath}$HOMESTEAD_WORKING_DIRg" files/Homestead.yaml
sed -i "" -e "s{vendorPath}$HOMESTEAD_VENDOR_DIRg" files/Homestead.yaml

# Copy needed files
cp -rfi resources/after.sh files/after.sh
cp -rfi resources/aliases files/aliases
cp -rfi resources/custom/* files/custom/

echo "Homestead initialized!"
