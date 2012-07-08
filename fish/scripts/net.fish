function ip -d 'Get current Internet IP address'
    dig +short myip.opendns.com @resolver1.opendns.com
end

function lip -d 'Get current local network IP address'
	ifconfig | grep -A 5 $PRIMARY_NETWORK_INTERFACE | grep 'inet ' | cut -d\  -f2
end

