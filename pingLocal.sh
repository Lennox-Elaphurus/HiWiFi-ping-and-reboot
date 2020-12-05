#!/bin/sh

/bin/echo $(date) "test start"

/usr/bin/ping -w 30 -c 3 -i 2 baidu.com
#发起3次ping，每次ping之间间隔2秒，限时30秒

if  [ $? -ne 0 ];
then
	/bin/echo $(date) ERROR, rebooting eth2.2  
	/sbin/ifconfig eth2.2 down
	/bin/sleep 2
	/sbin/ifconfig eth2.2 up
	# 重启网线连接
else
	/bin/echo $(date) baidu.com connected
fi
