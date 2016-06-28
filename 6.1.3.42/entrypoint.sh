#!/bin/sh
set -e

if [ "$1" = 'sencha' ]; then
    exec "$@"
else
	exec sencha "$@"
fi
