#!/bin/bash

date=`date +"%H:%M %d-%b-%Y"`
jam=`date +%H`
cat /var/log/syslog | xxd -p -c1 | awk -v r=$jam '
function hex2dec(h,i,x,v) {
  h=tolower(h);sub(/^0x/,"",h)
  for(i=1;i<=length(h);++i){
    x=index("0123456789abcdef",substr(h,i,1))
    if(!x)return "NaN"
    v=(16*v)+x-1
  }
  return v
}
BEGIN { jam = strtonum(r) }
{
	$1 = hex2dec(0x$1)
	if ($1 >= 65 && $1 <= 90) {
		$1 = $1 - 65
		$1 = ($1 + jam) % 26
		$1 = $1 + 65
	}
	if ($1 >= 97 && $1 <= 122) {
		$1 = $1 - 97
		$1 = ($1 + jam) % 26
		$1 = $1 + 97
	}
	printf("%c", $1)
}
' > /home/jendralhoki/sisop2019/modul1/soalnomor4/"$date".log

