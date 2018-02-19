#!/usr/bin/env bash

# Java Mac OSX specific installation
java_jdk_dmg=jdk-8u161-macosx-x64.dmg

curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u161-b12/2f38c3b165be4555a1fa6e98c45e0808/jdk-8u161-macosx-x64.dmg > $HOME/Downloads/$java_jdk_dmg

generatedhash=$(md5 -q $HOME/Downloads/$java_jdk_dmg)
java_jdk_dmg_hash=f2df502b145d78ae2ab1bb4b6c3301d4

if [[ $generatedhash != $java_jdk_dmg_hash ]]; then
  # Recuperare il nome dello script come al solito.
  echo "Hash for file $java_jdk_dmg doesn't match, downloaded file corrupted. Retry executing only this script."
  return
fi

hdiutil attach $HOME/Downloads/$java_jdk_dmg

sudo installer -pkg /Volumes/JDK\ 8\ Update\ 161/JDK\ 8\ Update\ 161.pkg -target /
diskutil umount /Volumes/JDK\ 8\ Update\ 161/
\rm $HOME/Downloads/$java_jdk_dmg
