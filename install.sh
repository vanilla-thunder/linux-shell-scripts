#!/bin/bash

ln -f -s $(pwd)/a2reload  /bin/a2reload
ln -f -s $(pwd)/a2restart /bin/a2restart
ln -f -s $(pwd)/cleartmp  /bin/cleartmp
ln -f -s $(pwd)/oxget     /bin/oxget
ln -f -s $(pwd)/oxrights  /bin/oxrights
echo "symlinks created, do not delete this directory!"
