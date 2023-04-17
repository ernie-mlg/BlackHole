#!/bin/bash

if [ "$1" = "" ] || [ "$2" = "" ] || [ "$3" = "" ] || [ "$4" = "" ];then
    echo "illigal parameter"
    exit 1
fi

ASSEMBLY_NAME=$1
APP_DEVELOPER=$2
UUID=$3
DERIVEDDATAPATH=$4

cat ./BlackHole/BlackHole-Info.plist.template                                   | envsubst > ./BlackHole/BlackHole-Info.plist
cat ./BlackHole.xcodeproj/project.pbxproj.template                              | envsubst > ./BlackHole.xcodeproj/project.pbxproj
cat ./BlackHole.xcodeproj/xcshareddata/xcschemes/BlackHole.xcscheme.template    | envsubst > ./BlackHole.xcodeproj/xcshareddata/xcschemes/BlackHole.xcscheme

xcodebuild -project ./BlackHole.xcodeproj -scheme BlackHole -configuration Release -derivedDataPath $DERIVEDDATAPATH GCC_PREPROCESSOR_DEFINITIONS='$GCC_PREPROCESSOR_DEFINITIONS kDriver_Name=\"'${ASSEMBLY_NAME}_SpeakerCapture'\" kHas_Driver_Name_Format=false kManufacturer_Name=\"'${APP_DEVELOPER}'\"'

