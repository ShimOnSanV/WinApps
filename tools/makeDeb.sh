 #!/bin/bash

#the name of application
NAME="WinApps"
# the version number of application
VERSION="1.0"
# the version number of the current deb package
REVERSION="1"
# arm64 armhf i386 etc
ARCHITECTURE="amd64"

MAINTAINER="kacper-paczos@linux.pl"
DESCRIPTION="WinApp desc"

# make package name
PACKAGE=$NAME
PACKAGE+='_'
PACKAGE+=$VERSION
PACKAGE+='-'
PACKAGE+=$REVERSION
PACKAGE+='_'
PACKAGE+=$ARCHITECTURE

echo "The " + $PACKAGE "will be creted"
echo "Going outside in a tools' dir"
cd ..
echo "Make a DEB directory..."
mkdir -p "DEB"
echo "... go to a DEB directory..."
cd DEB

echo "Clean up the last version of " + $PACKAGE
rm -Rdf $PACKAGE

echo "Time to build " + $PACKAGE + ".deb package..."
echo "...created"
mkdir ${PACKAGE}
cd ${PACKAGE}

mkdir -p ./usr/local/bin

cp ../../WinApps_FrrstRunWizard/build/WinApps_FrrstRunWizard ./usr/local/bin/WinApps_FrrstRunWizard

# make basic structure of package
mkdir -p DEBIAN
touch ${PACKAGE}/control

cd DEBAIN
echo "Package: ${NAME}" >> control
echo "Version: ${VERSION}.${REVERSION}" >> control
echo "Architecture: ${ARCHITECTURE}" >> control
echo "Maintainer: WinApps team <${MAINTAINER}>" >> control
echo "Description: ${DESCRIPTION}" >> control
echo "Depends: libxcb-cursor0," >> control
echo "         libxcb-image0," >> control
echo "         libxcb-keysyms1," >> control
echo "         libxcb-render-util0," >> control
echo "         libxcb-xinerama0," >> control
echo "         libxcb-icccm4," >> control

# Brak skortku do uruchamiana aplikacji, tego co poniezej, manuala itd, przetesotac z WinApps_FrrstRunWizard
#Package (Required): Name of package
#Version (Required): Version of the package
#Maintainer (Required): Name and email of maintainer
#Architecture (Required): Supported target machine architecture
#Description (Required): Short description of the package
#Section: Package classification like admin, database, kernel, utils
#Priority: Whether the package is optional or required
#Essential: Whether the package is always required
#Depends: List other dependent packages like libc6 (>= 2.2.4-4)
#Homepage: URL of the website associated with the package
#Package-Type: Indicate the types, like deb or udeb, for example

cd ..



