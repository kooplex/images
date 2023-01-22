#!/bin/sh

sed -i -e "s,##BASEURL##,$REPORT_URL," /etc/shiny-server/shiny-server.conf

/init

#RUN adduser --no-create-home --uid 989 --disabled-password --home /srv shiny
#RUN usermod --uid 989 -d /srv/report/ shiny
#RUN usermod --uid 989 -d /srv/shiny-server/ shiny

#USER shiny
#RUN mv /opt/shiny-server/ext/node/bin/shiny-server /opt/shiny-server/ext/node/bin/shiny-server_
#RUN echo "#!/bin/bash" > /opt/shiny-server/ext/node/bin/shiny-server
#RUN echo "su shiny -c \"/opt/shiny-server/ext/node/bin/shiny-server_ \$@\" " >> /opt/shiny-server/ext/node/bin/shiny-server
#RUN chmod a+x /opt/shiny-server/ext/node/bin/shiny-server 
#RUN chown shiny /var/log/shiny-server

