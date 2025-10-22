#!/bin/sh

for SCRIPT in /.init_scripts/*
do
    if [ -x $SCRIPT ] ; then
        echo "Running init script: $SCRIPT"
	$SCRIPT
    elif [ -f $SCRIPT ] ; then
        echo "Sourcing init script: $SCRIPT"
        . $SCRIPT
    else
        echo "Not a file $SCRIPT"
    fi
done

echo "Sleeping for infinity"

exec 2> /var/log/hub/runserver.log
exec 1>&2

# chown www-data:nginx -R static/

cd /kooplexhub/kooplexhub/

/usr/local/bin/uwsgi -s /tmp/uwsgi.sock --uid 107 --gid 106 --wsgi-file kooplexhub/wsgi.py --daemonize
#service nginx start

