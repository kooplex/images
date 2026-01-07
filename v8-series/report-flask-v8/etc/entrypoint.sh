#!/bin/sh

cd $REPORT_FOLDER
. /opt/python-packages/bin/activate 
gunicorn -b 0.0.0.0:${REPORT_PORT} app:app 

sleep 1000
