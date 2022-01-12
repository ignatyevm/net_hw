#! /bin/bash

cd /home/buildsrv

cd repos

rm -rf $1.git

cd ../builds

rm -rf $1
