#!/bin/sh

cd $REPORT_FOLDER

if [ $(ls requirements.txt) ]; then 
	pip install -r requirements.txt;
fi

#. /opt/python-packages/bin/activate 
#gunicorn -b 0.0.0.0:${REPORT_PORT} app:app 

bash start.sh

sleep infinity
