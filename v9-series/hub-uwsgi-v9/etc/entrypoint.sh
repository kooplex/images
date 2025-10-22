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
exec 1> /dev/stdout
exec 2> /dev/stderr
echo "Sleeping for infinity"

# chown www-data:nginx -R static/
sleep infinity
#service nginx start

