#!/bin/sh

/bin/echo $(date) "test start"

/usr/bin/ping -w 30 -c 3 -i 2 baidu.com
#发起3次ping，每次ping之间间隔2秒，限时30秒

if  [ $? -ne 0 ];
then
	/bin/echo $(date) error reboot in 60s 
	/bin/sleep 60
	/sbin/reboot
	#等待60秒后重启
else
	/bin/echo $(date) baidu.com connected
fi
