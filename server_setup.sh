# update and some tools
apt-get update
apt-get upgrade
dpkg-reconfigure tzdata
apt-get -y install zip unzip bzip2 curl

# webserver
apt-get -y install apache2 libapache2-mod-php5 php5-cli php5-common php5-cgi php5-curl php5-gd php5-mcrypt php-mysql libapache2-mod-auth-mysql
a2enmod rewrite
a2enmod auth_mysql
service apache2 restart

# mysql stuff
read -p "wanna install mysql server and client? " -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]
then
  apt-get -y install mysql-common mysql-server mysql-client
  service apache2 restart
fi


# git
read -p "wanna install git? " -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]
then
  apt-get -y install git-core
fi

# installing node.js from backports + npm
read -p "wanna install nodejs? " -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]
then
  echo "deb http://ftp.us.debian.org/debian wheezy-backports main" >> /etc/apt/sources.list  
  apt-get update  
  apt-get -y install nodejs nodejs-legacy
  curl -L https://npmjs.org/install.sh | sh    
fi


# ImageMagick + imagick php api
read -p "wanna install ImageMagick and php api? " -n 1 -r
if [[ $REPLY =~ [Yy]$ ]]
then
  apt-get -y install imagemagick libpng-dev libjpeg-dev php5-imagick
fi
