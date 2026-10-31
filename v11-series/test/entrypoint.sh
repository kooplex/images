#!/bin/sh
if [ "$INIT_DEBUG" = "true" ]; then
    echo "Debug mode enabled; sleep infinity on errors"
    set +e
else
    set -e
fi

for SCRIPT in /.init-scripts/*; do
    if [ -x "$SCRIPT" ]; then
        echo "Running init script: $SCRIPT"
        "$SCRIPT"
	RC=$?

        if [ "$RC" -ne 0 ]; then
            echo "FAILED: $SCRIPT ($RC)"
	    
	    if [ "$INIT_CONTINUE_ON_ERROR" = "true" ]; then
		echo "Continuing despite error"
	    else
	        if [ "$INIT_DEBUG" = "true" ]; then
                    echo "Debug mode: sleeping for inspection"
                    exec sleep infinity
                else
                    echo "Exiting due to error"
                    exit $RC
                fi
	    fi
        fi
    elif [ -f "$SCRIPT" ]; then
        echo "Sourcing init script: $SCRIPT"
        . "$SCRIPT"
    fi
done

echo "No foreground process started; sleeping"
exec sleep infinity
