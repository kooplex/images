#!/bin/bash

# debug
# env
id $NB_USER

# Start the notebook server
if [ -z "$NEWGROUP" ] ; then
  exec su "$NB_USER" -c "cd /v; \
      export VENV_PATH=${VENV_PATH:-/opt/venv}; \
      export UV_CACHE_DIR=/tmp/.cache/uv; \
      mkdir -p \$UV_CACHE_DIR; \
      exec \$VENV_PATH/bin/jupyter notebook $* --ZMQChannelsWebsocketConnection.iopub_data_rate_limit=1.0e10"

else
  exec su $NB_USER -c "cd /v ; sg $NEWGROUP -c \"env PATH=$PATH jupyter notebook $* --ZMQChannelsWebsocketConnection.iopub_data_rate_limit=1.0e10 \""
fi

echo "shit happens :("
sleep infinity
