#!/bin/bash
#pretends to format disks

#disables control c
trap '' 2
# disables control z
trap "" SIGTSTP
color='\E[30;40m'
clear
echo "Formating disk(s): " /dev/sd*
sleep 2
echo "Initializing..."
sleep 2
echo -ne "Are you sure you want to format these disks?(y/n): "
sleep 1
echo "Y"
sleep 1
echo "formating starts in 5 seconds"
sleep 1
echo "4 seconds"
sleep 1
echo "3 seconds"
sleep 1
echo "2 seconds"
sleep 1
echo "1 second"
sleep 1

for i in {1..50000}
do
echo -n -e "\033[1m${color}0\033[0m"
done
sleep 1
echo ""
echo /dev/sd* "are formatted."
sleep 1
echo "be sure to make sure you reboot to clear operating system from RAM"