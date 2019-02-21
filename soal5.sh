#!/bin/bash
cat /var/log/syslog | awk '
{
	t=tolower($0)
	if(match(t,"sudo")==0 && match(t,"cron")!=0 && NF<13)
		print $0
}
' > /home/jendralhoki/modul1/syslog
