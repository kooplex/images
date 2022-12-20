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

echo "Starting notebook for $NB_USER..."
nice -n 19 /usr/local/bin/runjupyter.sh --config=/etc/jupyter_notebook_config.py --NotebookApp.base_url=$NB_URL --NotebookApp.port=$NB_PORT --NotebookApp.token=$NB_TOKEN ##--EnvironmentKernelSpecManager.display_name_template=\" {}\"


#echo "Sleeping for infinity"
#exec sleep infinity
