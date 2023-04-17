#!/bin/bash

if [ "$1" = "" ] || [ "$2" = "" ] || [ "$3" = "" ];then
    echo "illigal parameter"
    exit 1
fi

ASSEMBLY_NAME=$1
UUID=$2
DERIVEDDATAPATH=$3

cat ./BlackHole/BlackHole-Info.plist.template                                   | envsubst > ./BlackHole/BlackHole-Info.plist
cat ./BlackHole.xcodeproj/project.pbxproj.template                              | envsubst > ./BlackHole.xcodeproj/project.pbxproj
cat ./BlackHole.xcodeproj/xcshareddata/xcschemes/BlackHole.xcscheme.template    | envsubst > ./BlackHole.xcodeproj/xcshareddata/xcschemes/BlackHole.xcscheme

xcodebuild -project ./BlackHole.xcodeproj -scheme BlackHole -configuration Release -derivedDataPath $DERIVEDDATAPATH
