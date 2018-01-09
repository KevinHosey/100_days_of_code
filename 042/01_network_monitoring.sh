#!/bin/bash


########## HOSTS AND PORTS TO BE CHECKED ##########

# DOMAIN NAMES CAN BE USED INSTEAD OF IP ADDRESSES
# THE DESCRIPTION MUST NOT CONTAIN ANY DOTS

host=("${host[@]}" "172.16.1.1" "Main Server" "--")
host=("${host[@]}" "172.16.1.2" "Freeradius" "80" "443" "1812" "1813" "--")
host=("${host[@]}" "172.16.1.3" "LDAP" "389" "--")
host=("${host[@]}" "172.16.2.1" "DD-WRT" "80" "--")
host=("${host[@]}" "10.95.66.101" "E-Learning 1" "22" "80" "443" "--")
host=("${host[@]}" "10.95.66.102" "E-Learning 2" "22" "80" "443" "--")
host=("${host[@]}" "10.95.66.103" "Mail" "25" "80" "110" "143" "443" "--")
host=("${host[@]}" "172.16.2.2" "Proxy" "8080" "--")
host=("${host[@]}" "172.16.3.1" "Switch (R200)" "--")
host=("${host[@]}" "172.16.3.2" "Switch (R200)" "--")
host=("${host[@]}" "172.16.3.3" "Switch (R400)" "--")
host=("${host[@]}" "172.16.3.4" "Switch (R400)" "--")
host=("${host[@]}" "172.16.4.1" "Access Point (R001)" "--")
host=("${host[@]}" "172.16.4.2" "Access Point (R002)" "--")
host=("${host[@]}" "172.16.4.3" "Access Point (R003)" "--")
host=("${host[@]}" "172.16.4.4" "Access Point (R004)" "--")
host=("${host[@]}" "172.16.4.5" "Access Point (R005)" "--")
host=("${host[@]}" "172.16.4.6" "Access Point (R006)" "--")
host=("${host[@]}" "172.16.4.7" "Access Point (R007)" "--")
host=("${host[@]}" "172.16.4.8" "Access Point (R008)" "--")
host=("${host[@]}" "172.16.4.9" "Access Point (R009)" "--")
host=("${host[@]}" "172.16.4.10" "Access Point (R010)" "--")
host=("${host[@]}" "172.16.4.11" "Access Point (R011)" "--")
host=("${host[@]}" "172.16.4.12" "Access Point (R012)" "--")
host=("${host[@]}" "172.16.4.13" "Access Point (R013)" "--")
host=("${host[@]}" "172.16.4.14" "Access Point (R014)" "--")
host=("${host[@]}" "172.16.4.15" "Access Point (R015)" "--")


########## IPS NOT TO PING (DUE TO FIREWALL RESTRICTIONS) ##########

noping="172.16.2.2"


########## CHECK THE FOLLOWING PORTS VIA UDP INSTEAD OF TCP ##########

udp="1812;1813"


########## COLOR SHORTCUTS ##########

red="\033[31m"
lightred="\033[91m"
green="\033[32m"
lightgreen="\033[92m"
blue="\033[34m"
lightblue="\033[94m"
magenta="\033[35m"
lightmagenta="\033[95m"
cyan="\033[36m"
lightcyan="\033[96m"
yellow="\033[33m"
lightyellow="\033[93m"
blink="\033[5m"
def="\033[0m"


########## MAIN LOOP ##########

while true; do

        systemerror=0
        porterror=0
        clear;
        echo -ne "$lightyellow"
        date;
        echo -ne "$def"

        # traverse the host array
        for value in "${host[@]}"; do
                # does the value contain a dot? (if so, assume it is an ip address or domain name)
                if [[ "$value" == *.* ]]; then
                        ip=$value
                # or is it a number? (if so, assume it is a port)
                elif [ $value -eq $value &> /dev/null ]; then
                        port=("${port[@]}" "$value")
                # or is it the end of record marker? (if so, perform the ping/port check)
                elif [ "$value" == "--" ]; then
                        echo
                        echo -n "$name -->"
                        pingfailed=0
                        # ping the host (only if the ip/domain name is not part of the noping string)
                        if [[ "$noping" != *$ip* ]]; then
                                ping -c1 $ip &> /dev/null
                                if [ $? -eq 0 ]; then
                                        # green if ping was successful
                                        echo -ne "$green $ip $def"
                                else
                                        # red if ping has failed
                                        echo -ne "$lightred $ip $def"
                                        systemerror=$(($systemerror+1))
                                        pingfailed=1
                                fi
                        else
                                # yellow if no ping has been performed
                                echo -ne "$yellow $ip $def"
                        fi
                        # traverse the port array (only if the ping did not fail)
                        if [ $pingfailed -eq 0 ]; then
                                for value2 in "${port[@]}"; do
                                        # set protocol to tcp
                                        prot="-4"
                                        # change protocol to udp for the pre-defined ports
                                        if [[ "$udp" == *$value2* ]]; then prot="-u"; fi
                                        # check the port using netcat
                                        nc $prot -w 2 -z -v $ip $value2 &> /dev/null
                                        if [ $? -eq 0 ]; then
                                                # green if port is open
                                                echo -ne "$green $value2 $def"
                                        else
                                                # red if port is closed
                                                echo -ne "$lightred $value2 $def"
                                                porterror=$(($porterror+1))
                                        fi
                                done
                        fi
                        # reset port array
                        declare -a port=()
                # if value is not an ip address, not a port and not the trigger, then it must be a name
                else
                        name=$value
                fi
        done

        # blinking eof
        echo
        echo
        echo -ne "${lightyellow}${blink}*** $def"

        # audio notification in case of an error
        errors=$(($systemerror+$porterror))
        if [ $errors -gt 0 ]; then
                afplay -v 0.2 /Users/acidx/Library/Sounds/Alarm.aiff
                say -v Zarvox "Network malfunction detected."
        fi

        # wait 10 minutes before next check
        sleep 6s
done