#!/bin/bash

##--------------------------------------------------------------------
## Copyright (c) 2018 OSIsoft, LLC
##
## Licensed under the Apache License, Version 2.0 (the "License");
## you may not use this file except in compliance with the License.
## You may obtain a copy of the License at
##
##     http://www.apache.org/licenses/LICENSE-2.0
##
## Unless required by applicable law or agreed to in writing, software
## distributed under the License is distributed on an "AS IS" BASIS,
## WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
## See the License for the specific language governing permissions and
## limitations under the License.
##--------------------------------------------------------------------
##
## Author: Ivan Zoratti
##


set -e

usage="$(basename "$0") {x86|arm}
This script is used to create the Debian package of FogLAMP
Arguments: 
 x86 - Build an x86_64 package
 arm - Build an armv7l package"

GIT_ROOT=`pwd`    # The script must be executed from the root git directory

# Check FOGLAMP_ROOT
if [ -z ${FOGLAMP_ROOT+x} ]; then
    # Set FOGLAMP_ROOT as the default directory
    if [ -d "/usr/local/foglamp" ]; then
      FOGLAMP_ROOT="/usr/local/foglamp"
      export FOGLAMP_ROOT
    else
      echo "No FOGLAMP_ROOT directory found - Program exit."
      exit 1
    fi
fi

version=`cat ${FOGLAMP_ROOT}/VERSION | tr -d ' ' | grep 'foglamp_version=' | head -1 | sed -e 's/\(.*\)=\(.*\)/\2/g'`
BUILD_ROOT="${GIT_ROOT}/packages/Debian/build"

case "$1" in
    x86)
        architecture="x86_64"
        ;;
    arm)
        architecture="armhf"
        ;;
    *)
        echo "${usage}"
        exit 1
        ;;
esac

# Final package name
package_name="foglamp-${version}-${architecture}"

# Print the summary of findings
echo "The package root directory is : ${GIT_ROOT}"
echo "The FogLAMP directory is      : ${FOGLAMP_ROOT}"
echo "The FogLAMP version is        : ${version}"
echo "The Package will be built in  : ${BUILD_ROOT}"
echo "The architecture is set as    : ${architecture}"
echo "The package name is           : ${package_name}"
echo

# Create the package directory. If a directory with the same name exists,
# it is copied with a version number.

# First, create the BUILD_ROOT folder, if necessary
if [ ! -L "${BUILD_ROOT}" -a ! -d "${BUILD_ROOT}" ]; then
    mkdir -p "${BUILD_ROOT}"
fi

cd "${BUILD_ROOT}"
existing_pkgs=`find . -maxdepth 1 -name "${package_name}.????" | wc -l`
existing_pkgs=$((existing_pkgs+1))
new_stored_pkg=$(printf "${package_name}.%04d" "${existing_pkgs}")
if [ -d "${package_name}" ]; then
    echo "Saving the old working environment as ${new_stored_pkg}"
    mv "${package_name}" "${new_stored_pkg}"
fi
mkdir "${package_name}"

# Populate the package directory with Debian files
# First with files common to all pla
echo -n "Populating the package..."
cd "${package_name}"
cp -R ${GIT_ROOT}/packages/Debian/common/* .
cp -R ${GIT_ROOT}/packages/Debian/${architecture}/* .

mkdir -p usr/local/foglamp
cd usr/local/foglamp
cp -R ${FOGLAMP_ROOT}/* .
echo "Done."

# Add customised files
#echo -n "Adding FogLAMP customization..."

#cp -R ${GIT_ROOT}/share/* share/postgresql/.
#cd ${BUILD_ROOT}/${package_name}/usr/local/foglamp/plugins/storage/postgres
#mkdir bin
#cp ${GIT_ROOT}/scripts/* bin/.
#echo "Done."

# Build the package
cd "${BUILD_ROOT}"

# Save the old versions
existing_pkgs=`find . -maxdepth 1 -name "${package_name}.deb.????" | wc -l`
existing_pkgs=$((existing_pkgs+1))
new_stored_pkg=$(printf "${package_name}.deb.%04d" "${existing_pkgs}")

if [ -e "${package_name}.deb" ]; then
    echo "Saving the old package as ${new_stored_pkg}"
    mv "${package_name}.deb" "${new_stored_pkg}"
fi

echo "Building the new package..."
dpkg-deb --build ${package_name}
echo "Building Complete."


exit 0
