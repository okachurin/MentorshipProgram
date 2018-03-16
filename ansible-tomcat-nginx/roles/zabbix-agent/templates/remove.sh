#!/bin/bash
# Remove-Zabbix Init script should run when an AWS instance goes down and remove itself from Zabbix Server
# chkconfig: - 84 02
# description: Remove from zabbix
# Source function library.
touch /home/ubuntu/good1

        HOST_NAME=TomcatAgent

        USER='Admin'
        PASS='zabbix'
        ZABBIX_SERVER='172.31.45.98'
        API='http://172.31.45.98/zabbix/api_jsonrpc.php'

        # Authenticate with Zabbix API

        authenticate() {
                echo `curl -s -H  'Content-Type: application/json-rpc' -d "{\"jsonrpc\": \"2.0\",\"method\":\"user.login\",\"params\":{\"user\":\""${USER}"\",\"password\":\""${PASS}"\"},\"auth\": null,\"id\":0}" $API`
        }

        AUTH_TOKEN=`echo $(authenticate)|jq -r .result`

        # Get This Host HostId:

        gethostid() {
               echo `curl -s -H 'Content-Type: application/json-rpc' -d "{\"jsonrpc\": \"2.0\",\"method\":\"host.get\",\"params\":{\"output\":\"extend\",\"filter\":{\"host\":[\""$HOST_NAME"\"]}},\"auth\":\""${AUTH_TOKEN}"\",\"id\":0}" $API`
        }

        HOST_ID=`echo $(gethostid)|jq -r .result[0].hostid`

        # Remove Host

        remove_host() {
                echo `curl -s -H 'Content-Type: application/json-rpc' -d "{\"jsonrpc\": \"2.0\",\"method\":\"host.delete\",\"params\":[\""${HOST_ID}"\"],\"auth\":\""${AUTH_TOKEN}"\",\"id\":0}" $API`
        }
        RESPONSE=$(remove_host)
        echo ${RESPONSE}
exit 0
