#!/bin/bash

# debug
# env
id $NB_USER

# Start the notebook server
if [ -z "$NEWGROUP" ] ; then
  exec su $NB_USER -c "cd /v ; env PATH=$PATH jupyter notebook $* --ZMQChannelsWebsocketConnection.iopub_data_rate_limit=1.0e10 "
else
  exec su $NB_USER -c "cd /v ; sg $NEWGROUP -c \"env PATH=$PATH jupyter notebook $* --ZMQChannelsWebsocketConnection.iopub_data_rate_limit=1.0e10 \""
fi
