#! /bin/bash

exec 2> /var/log/oauth/runserver.log
exec 1>&2


cd /srv/oauth

/usr/bin/python3 manage.py runserver 0.0.0.0:80 || true

echo "SHOULD NOT REACH THIS POINT"

sleep infinity

