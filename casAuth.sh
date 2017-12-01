#!/bin/bash -x 

echo "Anzal Parameter: $#"

if ! [ $# -eq 2 ]
then
    echo "unsufficient missing"
    echo "1 usage: getResponse.sh <USERNAME> <PASSWORD>"
    exit 1
fi

USERNAME=$1
PASSWORD=$2

# Enter Username and password
 
export CAS_LOGIN_URL=https://cas.acentic.com/CasServer/v1/tickets
#export CAS_LOGIN_URL=https://dev-cas-server:443/CasServer/v1/tickets

export GET_URL=https://acs.acentic.com/CloudServices/public/doLoginCasUserManual.action
#export GET_URL=https://de-ws-16:18443/CloudServices/public/doLoginCasUserManual.action

export AUTH_SERVICE=https://acs.acentic.com/CloudServices/gpns/getCircuitTyps.action
#export AUTH_SERVICE=https://de-ws-16:18443/CloudServices/gpns/getCircuitTyps.action
 

# This files is used to store the Ticket Getting Ticket, the response and the getServiceTicketURL
if [ -f "tgt.txt" ]
then
    rm tgt.txt
fi
if [ -f "tgt-response.txt" ]
then
    rm tgt-response.txt
fi
if [ -f "service-ticket-url.txt" ]
then
    rm service-ticket-url*
fi

 
# This file is used to store the Service Ticket
if [ -f "serviceTicket.txt" ]
then 
    rm serviceTicket*
fi
 
#This file is used to store the service call response
if [ -f "response.txt" ]
then
    rm response*
fi
 
echo "################################# REQUESTING TGT ##########################################" 

# Request a new Ticket Getting Ticket (TGT).  This returns HTML which is put into tgt-response.txt.
wget --no-check-certificate -O tgt-response.txt --post-data="username=$USERNAME&password=$PASSWORD" $CAS_LOGIN_URL
 
 
if [ -s "tgt-response.txt" ]
then
    echo "### tgt-response: `cat tgt-response.txt`"

    # Extract from the HTML the TGT url and put it to :"service-ticket-url.txt"
#    echo serviceTicekt-1 `cat tgt-response.txt | grep -oP 'https[a-zA-Z0-9\/\:\-\.]*'`

    echo `cat tgt-response.txt | grep -oP 'https[a-zA-Z0-9\/\:\-\.]*TGT-[0-9]*-[a-zA-Z0-9]*-[a-z\.\-]*'` > service-ticket-url.txt
    echo "### service-ticket-url: `cat service-ticket-url.txt`"

    # Extract from the HTML the TGT and put it to :"tgt.txt"
    echo `cat service-ticket-url.txt | grep -oE 'TGT-[0-9]*-[a-zA-Z0-9]*[a-z\,\.\-]'` > tgt.txt
    echo "### TGT: `cat tgt.txt`"
 

    echo "########################## REQUESTING ServiceTicket ########################################" 

    # Request a new Service Ticket and store in serviceTicket.txt
    wget --no-check-certificate --post-data="service=$AUTH_SERVICE" -O serviceTicket.txt `cat service-ticket-url.txt`



    if [ -s "serviceTicket.txt" ]
    then 
        # Get the data from the service and store it into response.txt
        wget --no-check-certificate -O response.txt $GET_URL?authServiceTicket=`cat serviceTicket.txt`\&authService=$AUTH_SERVICE
 
	if [ -s "response.txt" ]
        then
			# Display the data from the service call
			echo `cat response.txt`
        else
            echo "ERROR no response from auth-service"
        fi

    else 
        echo "Error getting ServiceTicket"
    fi
else
    echo "Error getting TGT"
fi



