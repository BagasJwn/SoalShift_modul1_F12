#!/bin/bash

for ((i=1;i<999;i++))
do
if [ ! -f password$i.txt ]
then
head /dev/urandom | tr -dc a-zA-Z0-9 | head -c12 > /home/jendralhoki/sisop2019/modul1/soalnomor3/password$i.txt
break
fi
done
