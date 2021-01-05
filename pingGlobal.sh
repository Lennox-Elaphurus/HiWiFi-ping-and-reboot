#!/bin/sh

/bin/echo $(date) "test start"
i=1
# while [ $i -le 3 ];
# do
# 	/bin/echo $(date) sleeping $i/3
# 	/bin/sleep 10
# 	i=$(($i+1))
# done
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

	ping -w 10 -c 3 -i 2 google.cn
    #发起3次ping，每次ping之间间隔2秒，限时10秒
	if  [ $? -ne 0 ];
	then
		/bin/echo $(date) ERROR, rebooting eth2.2  
		/sbin/ifconfig eth2.2 down
		/bin/sleep 10
		/sbin/ifconfig eth2.2 up
		# 重启网线连接
	else
		/bin/echo $(date) google.cn connected
	fi
done
