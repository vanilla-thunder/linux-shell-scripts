linux shell scripts
===================
tested with debian linux only,
so you might need to change some commands if you use different dist

## scripts for oxid

### oxget
downloads newest oxid ce and unzips it into the current folder  
requires the unzip package (e.g. apt-get install unzip)


### oxrights
sets chown and chmod permissions for files and directories:
<pre><code>
  chown -R root:www-data *
  chmod 2775 for directories
  chmod 664 for files
 </code></pre>


## random scripts

### a2restart
equal to "service apache restart"

### a2reload
equal to "service apache reload"