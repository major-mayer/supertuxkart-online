#!/bin/bash
echo "Initialize SuperTuxKart user account"
supertuxkart --init-user --login=$stk_user --password=$stk_pw



if [[ ! -z "$stk_aikarts" && "$stk_aikarts" > "0" ]]
then 
    echo "\$stk_aikarts is set"
    echo "Starting SuperTuxKart server in background"
    supertuxkart --server-config=/home/stk/.config/supertuxkart/config-0.10/server_config.xml --login=$stk_user --password=$stk_pw &
    
    if [ -z "$stk_serverpw" ]
    then
        echo "\$stk_serverpw is empty - connect $stk_aikarts bots to server without a password"
        sleep 15 && supertuxkart --connect-now=localhost:2759 --disable-polling --network-ai=$stk_aikarts --login=$stk_aiuser --password=$stk_aipw

    else
        echo "\$stk_serverpw is set - connect $stk_aikarts bots to server with password"
        sleep 15 && supertuxkart --connect-now=localhost:2759 --disable-polling --server-password=$stk_serverpw --network-ai=$stk_aikarts --login=$stk_aiuser --password=$stk_aipw

    fi
    
else
    echo "\$stk_aikarts is not set"
    echo "Starting SuperTuxKart server in foreground"
    supertuxkart --server-config=/home/stk/.config/supertuxkart/config-0.10/server_config.xml --login=$stk_user --password=$stk_pw
fi
