#!/bin/bash
#
# Entrypoint
#
# Ensure persistent data is stored in /data/ and then start the stack

if [ "$PGDATA" == "/data/database" ] && [ -d /data ]
then
   if [ ! -d  /data/database ]
   then
      # Populate
      cp -rp /var/lib/postgresql/data /data/database
   fi
fi

chown -R postgres:postgres $PGDATA

/usr/bin/supervisord
