#! /bin/bash

cd /home/buildsrv

cd repos
mkdir $1.git
cd $1.git
git init --bare
cd ..
chmod -R 770 $1.git
cd ..

cd builds
mkdir $1
cd $1
mkdir build bin src
git clone /home/buildsrv/repos/$1.git src/
chmod -R 077 src
chmod -R 077 bin
chmod -R 077 build
