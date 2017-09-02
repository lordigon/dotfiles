#!/usr/bin/env bash

# Java Mac OSX specific installation
java_jdk_dmg=jdk-8u144-macosx-x64.dmg

curl -v -j -k -L -H "Cookie: oraclelicense=accept-securebackup-cookie" http://download.oracle.com/otn-pub/java/jdk/8u144-b01/090f390dda5b47b9b721c7dfaa008135/jdk-8u144-macosx-x64.dmg > $HOME/Downloads/$java_jdk_dmg

generatedhash=$(md5 -q $java_jdk_dmg)
java_jdk_dmg_hash=b96375812255bf23f84cdb0c8fd2606b

if [[ $generatedhash != $java_jdk_dmg_hash ]]; then
  # Recuperare il nome dello script come al solito.
  echo "Hash for file $java_jdk_dmg doesn't match, downloaded file corrupted. Retry executing only this script."
  return
fi

hdiutil attach $java_jdk_dmg

sudo installer -pkg /Volumes/JDK\ 8\ Update\ 144/JDK\ 8\ Update\ 144.pkg -target /
diskutil umount /Volumes/JDK\ 8\ Update\ 144/
\rm $java_jdk_dmg

export JAVA_HOME=$( /usr/libexec/java_home )
export PATH=${JAVA_HOME}/bin:$PATH
