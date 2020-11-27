#!/bin/ash
echo $(date) "test start"

ping -w 60 -c 3 -i 2 baidu.com
#发起3次ping，每次ping之间间隔2秒，限时60秒

if  [ $? -ne 0 ];
then
	echo $(date) error reboot in 180s 
	sleep 180
	reboot
	#等待180秒后重启
else
	echo $(date) baidu.com connected
fi
