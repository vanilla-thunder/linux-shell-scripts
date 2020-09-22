#!/bin/bash
chmod 777 . *
ln -f -s $(pwd)/a2reload /bin/a2reload
ln -f -s $(pwd)/a2restart /bin/a2restart
ln -f -s $(pwd)/cleartmp /bin/cleartmp
ln -f -s $(pwd)/oxget /bin/oxget
ln -f -s $(pwd)/ox6rights /bin/oxrights
ln -f -s $(pwd)/ox6rights /bin/ox6rights
ln -f -s $(pwd)/ox4rights /bin/ox4rights
ln -f -s $(pwd)/ox6modinstall /bin/ox6modinstall
ln -f -s $(pwd)/ox6modupdate /bin/ox6modupdate
ln -f -s $(pwd)/ox6modenable /bin/ox6modenable
ln -f -s $(pwd)/ox6moddisable /bin/ox6moddisable
echo "symlinks created, do not delete this directory!"
