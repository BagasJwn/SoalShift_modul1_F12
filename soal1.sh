#!/bin/bash

for foto in *.jpg

do 
	base64 -d $foto | xxd -r > /home/jendralhoki/sisop2019/modul1/soalnomor1/nature/jadi/$foto
done 
