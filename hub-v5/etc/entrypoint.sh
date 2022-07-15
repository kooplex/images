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

##FIXME: this is not nice
#env > /var/spool/cron/crontabs/root
#echo -e "*/1 * * * * /usr/bin/python3 /kooplexhub/kooplexhub/manage.py scheduler\n" >> /var/spool/cron/crontabs/root
#/etc/init.d/cron start

cd /kooplexhub/kooplexhub/
#git pull


while (true) ; do
  echo "Waiting for mysql server"
  mysql -u $HUBDB_USER --password=$HUBDB_PW -h $HUBDB_HOSTNAME $HUBDB -e "SELECT 1"
  [ $? = 0 ] && break
  sleep 2
done

/usr/bin/python3 manage.py runserver 0.0.0.0:80

