### linux shell scripts
tested with debian andubuntu,
so you might need to change some commands if you use different distribution

### installation
create symlinks in /bin/ for files you want
or run ./install.sh

## $ oxget
downloads newest oxid ce and unzips it into the current folder  
requires the unzip package (e.g. apt-get install unzip)
## $ oxget 4.7.12
will download particular version, e.g. 4.7.12  
list of available versions can be found here: [http://wiki.oxidforge.org/Category:Downloads](http://wiki.oxidforge.org/Category:Downloads)

## $ oxrights
sets chown and chmod permissions for files and directories for oxid eshop, suitable for development phase  
for live shops you need to run `oxrights --live`

## $ cleartmp
used in shop root directory, it will clear tmp/

## $ a2restart
equal to "service apache restart"

## $ a2reload
equal to "service apache reload"

