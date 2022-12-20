#!/bin/bash
set -e


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

echo "---> Starting the Slurm Node Daemon (slurmd) ..."
groupmod slurm -g 995; usermod -u 995 -g 995 slurm
exec /usr/sbin/slurmd -Dvvv

exec "$@"
