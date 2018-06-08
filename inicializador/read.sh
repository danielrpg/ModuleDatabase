#!/bin/bash

file="init.sql"

if [ -f $file ] ; then
    rm $file
fi

for i in `seq 1 23`
do  
   cat "${i}_"*.sql
   echo "\n"
done >> $file

echo "COMMIT TRANSACTION;" >> $file
