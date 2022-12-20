#!/bin/sh



#if test -f $REPORT_FOLDER/main.py; then
cd $REPORT_FOLDER
/opt/conda/bin/gunicorn app:server -b 127.0.0.1:9000 --timeout 200
#else
#       /opt/conda/bin/bokeh serve  $REPORT_FOLDER --prefix ${REPORT_URL} --allow-websocket-origin 0.0.0.0 --port $REPORT_PORT 
#fi
