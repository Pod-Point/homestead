#!/usr/bin/env bash

#
## Official Homestead
#

if [[ -n "$1" ]]; then
    cp resources/Homestead.json Homestead.json
else
    cp resources/Homestead.yaml Homestead.yaml
fi

cp resources/after.sh after.sh
cp resources/aliases aliases


#
## ---------------------
## Custom Implementation
## ---------------------
#

if [ -d "files" ]; then
    find files/* -type f -not -name ".gitkeep" -exec rm -f {} \;
else
    mkdir files
fi

# Copy needed custom files
cp -Rf resources/custom/* files/

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

echo "Homestead initialized!"
