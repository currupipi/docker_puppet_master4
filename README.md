Puppet4 server approach

DOCS
https://docs.puppet.com/puppetserver/latest/services_master_puppetserver.html


WEBSERVER
* In puppet4 the service is a java application, no need of apache passenger anymore as it is production ready and performant enough, it uses jetty-based web server embedded in the JVM process

* To edit any config related to webserver edit (change port that means no more masterport parameter in puppet.conf will be taken into account,  or use an external CA)
/etc/puppetlabs/puppetserver/conf.d/webserver.conf

CA 
* To edit the policies for certificate signing of nodes edit
 /etc/puppetlabs/puppetserver/conf.d/auth.conf

USER
* To change the user that is running puppetserver, by default is puppet edit
/etc/default/puppetserver 

LOGS
* Can be found here
/var/log/puppetlabs/puppetserver

CONFIGURATION FILES
Under the path /etc/puppetlabs/puppetserver/conf.d

* auth.conf 
* global.conf
* puppetserver.conf
* web-routes.conf
* webserver.conf


CONTAINER OPERATIONS

*The puppetserver command must be launched in foreground

*Build the image in /home/mishkin/Docker/puppet_master4
docker build -t mishkin/puppet4:<tag> .

#Important: be careful withe the volume command as if it is in the Dockerfile it will map it to content in the volume shared folder in the host
#Run the image (pending to find the right path for environment data, etc to mount the volume to puppetmaster_volume)
docker run -d -p 8140:8140 --name my_puppet  mishkin/puppet4:<tag>


TODO

* Add config files to COPY in Dockerfile to set up  default RAM and all the settings etc
