#!/bin/bash
if [ -f subprojects/skia/.lastupdate ]; then
    lastupdate=$(cat subprojects/skia/.lastupdate)
    currentdate=$(TZ='Z' date +%d%m%y)
    if [ "$lastupdate" == "$currentdate" ]; then
        echo "skia is up to date"
        exit 0
    fi
fi

cd subprojects

wget -q https://github.com/EclipseLinux/Skia/releases/latest/download/skia-prebuilt-linux-x64.zip -O skia.zip
unzip -qo skia.zip

rm -rdf skia
mv bundle skia

rm skia.zip

echo $(TZ='Z' date +%d%m%y) > skia/.lastupdate