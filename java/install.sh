#!/usr/bin/env bash

source ./java.sh
source ./maven.sh


sudo -v
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

java_jdk_dmg=jdk-8u144-macosx-x64.dmg

curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-macosx-x64.dmg > $HOME/Downloads/$java_jdk_dmg

generatedhash=$(md5 -q $java_jdk_dmg)

if [[ $generatedhash != b96375812255bf23f84cdb0c8fd2606b ]]; then
  # Recuperare il nome dello script come al solito.
  echo "Hash for file $java_jdk_dmg doesn't match, downloaded file corrupted. Retry executing only this script."
  return
fi

hdiutil attach $java_jdk_dmg

sudo installer -pkg /Volumes/JDK\ 8\ Update\ 144/JDK\ 8\ Update\ 144.pkg -target /
diskutil umount /Volumes/JDK\ 8\ Update\ 144/
\rm $java_jdk_dmg