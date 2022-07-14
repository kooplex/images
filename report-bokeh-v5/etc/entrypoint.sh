#!/bin/sh



#if test -f $REPORT_FOLDER/main.py; then
/opt/conda/bin/bokeh serve  $REPORT_FOLDER --prefix ${REPORT_URL} --allow-websocket-origin k8plex-test.vo.elte.hu --port $REPORT_PORT 
#else
#       /opt/conda/bin/bokeh serve  $REPORT_FOLDER --prefix ${REPORT_URL} --allow-websocket-origin 0.0.0.0 --port $REPORT_PORT 
#fi
