#!/usr/bin/env bash

MAVEN_VERSION=3.5.0

[[ -x $(command -v wget) ]] && CMD="wget --no-verbose -O -"
[[ -x $(command -v curl) ]] > /dev/null 2>&1 && CMDx="curl -fsSL"

M2_INSTALL_DIR=/usr/local/opt/maven-$MAVEN_VERSION
M2_HOME=/usr/local/opt/maven

mkdir -p ${M2_INSTALL_DIR}

eval $CMD http://apache.osuosl.org/maven/maven-3/$MAVEN_VERSION/binaries/apache-maven-$MAVEN_VERSION-bin.tar.gz \
  | tar -xzC ${M2_INSTALL_DIR} --strip-components=1 && ln -s ${M2_INSTALL_DIR} ${M2_HOME}

