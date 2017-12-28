#! /bin/bash
# progress-bar2.sh

interval=1
long_interval=10

{
     trap "exit" SIGUSR1
     sleep $interval; sleep $interval
     while true
     do
       echo -n '.'     
       sleep $interval
     done; } &         

pid=$!
trap "echo !; kill -USR1 $pid; wait $pid"  EXIT       

echo -n 'Please wait while your food is prepared '
sleep $long_interval
echo ' Ready, enjoy your meal!'

kill -USR1 $pid
wait $pid            
trap EXIT

exit $?