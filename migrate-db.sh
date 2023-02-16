#!/bin/bash

MDBFILE="config/BD.mdb"
DBFILE="config/DB.db"
SCRIPTSDIR="scripts"

rm -rf $SCRIPTSDIR/
mkdir -p $SCRIPTSDIR/
mdb-schema $MDBFILE sqlite > $SCRIPTSDIR/SCHEMA.sql


for tablename in $( mdb-tables $MDBFILE ); do 
  echo $tablename
  mdb-export -D "%Y-%m-%d %H:%M:%S" -H -I sqlite $MDBFILE $tablename> $SCRIPTSDIR/TABLE_$tablename.sql
done

cat $SCRIPTSDIR/SCHEMA.sql > $SCRIPTSDIR/FULL.sql
for script in $SCRIPTSDIR/TABLE_*.sql ; do 
  echo $script
  cat $script >> $SCRIPTSDIR/FULL.sql
done

rm -r $DBFILE
cat $SCRIPTSDIR/FULL.sql | sqlite3 $DBFILE

rm -rf $SCRIPTSDIR/