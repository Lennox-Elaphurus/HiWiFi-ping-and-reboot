#!/bin/ash
echo $(date) "test start"
i=1
while [ $i -le 12 ];
do
	echo $(date) sleeping $i/30 
	sleep 10
	i=$(($i+1))
done
#等待30*10秒

while [ true ];
do
	i=1
	while [ $i -le 18 ];
	do
		echo $(date) sleeping $i/18
		sleep 10
		i=$(($i+1))
	done
    #等待18*10秒

	ping -w 60 -c 3 -i 2 baidu.com
    #发起3次ping，每次ping之间间隔2秒，限时60秒
	if  [ $? -ne 0 ];
	then
		echo $(date) error reboot in 180s 
		sleep 180
		reboot
	else
		echo $(date) baidu.com connected
	fi
done
