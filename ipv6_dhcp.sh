while :

do
    HOST=google.com

    ping -c1 -4 $HOST 1>/dev/null 2>/dev/null
    SUCCESS4=$?

    ping -c1 -6 $HOST 1>/dev/null 2>/dev/null
    SUCCESS6=$?

    if [ $SUCCESS4 -eq 0 ] && [ $SUCCESS6 -eq 0 ]
    then
      echo "$HOST -4 and -6 have replied"
    elif [ $SUCCESS4 -eq 0 ] && [ $SUCCESS6 -eq 1 ]
      then 
      echo "$HOST -6 didn't reply"
      echo 'goo' | sudo -S systemctl start dhcpcd && sudo dhcpcd -k && sudo systemctl stop dhcpcd && sudo systemctl start dhcpcd
    elif [ $SUCCESS4 -eq 1 ] && [ $SUCCESS6 -eq 0 ]
      then 
      echo "$HOST -4 didn't reply"
      echo 'goo' | sudo -S systemctl start dhcpcd && sudo dhcpcd -k && sudo systemctl stop dhcpcd && sudo systemctl start dhcpcd
    elif [ $SUCCESS4 -eq 1 ] && [ $SUCCESS6 -eq 1 ]
      then 
      echo "$HOST -4 and -6 didn't reply"
      echo 'goo' | sudo -S systemctl start dhcpcd && sudo dhcpcd -k && sudo systemctl stop dhcpcd && sudo systemctl start dhcpcd
    fi
    #EOF

    sleep 15
done