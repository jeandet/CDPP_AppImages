#!/bin/sh

# this script assumes it runs on Centos 7 with  [wget fuse.x86_64 fuse-libs.x86_64 file] installed

wget https://javadl.oracle.com/webapps/download/GetFile/1.8.0_321-b07/df5ad55fdd604472a86a45a217032c7d/linux-i586/jre-8u321-linux-x64.tar.gz
wget https://github.com/AppImage/AppImageKit/releases/download/continuous/appimagetool-x86_64.AppImage

tar -xf jre-8u321-linux-x64.tar.gz
rm jre-8u321-linux-x64.tar.gz
chmod +x ./appimagetool-x86_64.AppImage && ./appimagetool-x86_64.AppImage --appimage-extract

for APP in PropagationTool 3DView
do 
	cp -r jre1.8.0_321 ./${APP}.AppDir/
	mkdir -p ./${APP}.AppDir/lib
	cp -r /usr/lib64/libnsl* ./${APP}.AppDir/lib/
        ./squashfs-root/AppRun ./${APP}.AppDir
done
