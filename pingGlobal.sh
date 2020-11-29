#!/bin/sh

/bin/echo $(date) "test start"
i=1
while [ $i -le 3 ];
do
	/bin/echo $(date) sleeping $i/3
	/bin/sleep 10
	i=$(($i+1))
done
#等待3*10秒

while [ true ];
do
	i=1
	while [ $i -le 6 ];
	do
		/bin/echo $(date) sleeping $i/6
		/bin/sleep 10
		i=$(($i+1))
	done
    #等待6*10秒

	ping -w 30 -c 3 -i 2 baidu.com
    #发起3次ping，每次ping之间间隔2秒，限时30秒
	if  [ $? -ne 0 ];
	then
		/bin/echo $(date) error reboot in 60s 
		/bin/sleepsleep 60
		/sbin/reboot
	else
		/bin/echo $(date) baidu.com connected
	fi
done
