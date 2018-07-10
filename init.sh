#!/usr/bin/env bash

#
## Official Homestead
#

if [[ -n "$1" ]]; then
    cp -f resources/Homestead.json Homestead.json
else
    cp -f resources/Homestead.yaml Homestead.yaml
fi

cp -f resources/after.sh after.sh
cp -f resources/aliases aliases

#
## ---------------------
## Custom Implementation
## ---------------------
#

find files/* -type f -not -name ".gitkeep" -exec rm -f {} \;

if [[ -n "$1" ]]; then
    cp -f resources/localized/Homestead.json files/Homestead.json
else
    cp -f resources/localized/Homestead.yaml files/Homestead.yaml
fi

# Check and set needed environment variables for Homestead Working Directory's path
if [[ -z "${HOMESTEAD_WORKING_DIR}" ]]; then
    read -e -p "Absolute path to your main code folder: " path

    export HOMESTEAD_WORKING_DIR=${path}
fi

# Check and set needed environment variables for Homestead vendors' path
if [[ -z "${HOMESTEAD_VENDOR_DIR}" ]]; then
    read -e -p "Absolute path to your Homestead vendor folder: " path

    export HOMESTEAD_VENDOR_DIR=${path}
fi

# Replace paths in Homestead config
sed -i "" -e "s{codeRepositoryPath}$HOMESTEAD_WORKING_DIRg" files/Homestead.yaml
sed -i "" -e "s{vendorPath}$HOMESTEAD_VENDOR_DIRg" files/Homestead.yaml

# Copy needed files
cp -f resources/after.sh files/after.sh
cp -f resources/aliases files/aliases
cp -f resources/custom/* files/custom/

echo "Homestead initialized!"
