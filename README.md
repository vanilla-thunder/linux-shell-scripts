linux shell scripts
===================
tested with debian linux only,
so you might need to change some commands if you use different dist

## scripts for oxid

### oxget
downloads newest oxid ce and unzips it into the current folder  
requires the unzip package (e.g. apt-get install unzip)


### oxrights
sets chown and chmod permissions for files and directories


## random scripts

### server_setup.sh
script for installing following components on a fresh debian installation (e.g. premaring a test/dev vm)
* zip, unzip, bzip2, curl
* apache2, libapache2-mod-php5, libapache2-mod-auth-mysql
* PHP5: php5-cli php5-common php5-cgi php5-curl php5-gd php5-mcrypt php-mysql
* Apache Mods: mod_rewrite, auth_mysql
 
##### optional (asks for confirmation):
* MYSQL: mysql-common mysql-server mysql-client
* GIT: git-core
* NODE.JS: nodejs nodejs-legacy (backports) + NPM
* imagemagick libpng-dev libjpeg-dev php5-imagick


### a2restart
equal to "service apache restart"

### a2reload
equal to "service apache reload"

