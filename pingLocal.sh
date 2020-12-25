#!/bin/sh

/bin/echo $(date) "test start"

/usr/bin/ping -w 10 -c 3 -i 2 google.cn
#发起3次ping，每次ping之间间隔2秒，限时10秒

if  [ $? -ne 0 ];
then
	/bin/echo $(date) ERROR, rebooting eth2.2  
	/sbin/ifconfig eth2.2 down
	/bin/sleep 2
	/sbin/ifconfig eth2.2 up
	# 重启网线连接

	/bin/sleep 10
	/usr/bin/ping -w 10 -c 3 -i 2 google.cn
	# 再次发起3次ping，每次ping之间间隔2秒，限时10秒
	if  [ $? -ne 0 ];
	then
		/bin/echo $(date) error reboot in 30s 
		/bin/sleep 30
		/sbin/reboot
	else
		/bin/echo $(date) google.cn connected
	fi
else
	/bin/echo $(date) google.cn connected
fi
