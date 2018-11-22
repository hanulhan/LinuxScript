#!/bin/sh
VERSION=79
sudo update-alternatives --install "/usr/bin/java" "java" "/opt/Oracle_Java/jdk1.7.0_${VERSION}/bin/java" 1
sudo update-alternatives --install "/usr/bin/javac" "javac" "/opt/Oracle_Java/jdk1.7.0_${VERSION}/bin/javac" 1
sudo update-alternatives --install "/usr/bin/javaws" "javaws" "/opt/Oracle_Java/jdk1.7.0_${VERSION}/bin/javaws" 1
sudo update-alternatives --install "/usr/bin/jar" "jar" "/opt/Oracle_Java/jdk1.7.0_${VERSION}/bin/jar" 1 
sudo update-alternatives --set "java" "/opt/Oracle_Java/jdk1.7.0_${VERSION}/bin/java"
sudo update-alternatives --set "javac" "/opt/Oracle_Java/jdk1.7.0_${VERSION}/bin/javac"
sudo update-alternatives --set "javaws" "/opt/Oracle_Java/jdk1.7.0_${VERSION}/bin/javaws"
sudo update-alternatives --set "jar" "/opt/Oracle_Java/jdk1.7.0_${VERSION}/bin/jar" 
