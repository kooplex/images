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

nice -n 19 /usr/local/bin/runjupyter.sh --config=/etc/jupyter_notebook_config.py --ServerApp.base_url=$NB_URL --ServerApp.port=$NB_PORT --IdentityProvider.token=$NB_TOKEN


##echo "Sleeping for infinity"
#exec sleep infinity
