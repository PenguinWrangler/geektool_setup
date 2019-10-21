#!/bin/bash

ipaddress="$(curl -s ifconfig.co)"
geo="$(curl -s https://tools.keycdn.com/geo.json?host=$ipaddress | sed 's/.*latitude":\(.*\),"metro_code".*/\1/' | tr -d '"longitude":')"

touch /tmp/forecast.txt

if [ "$ipaddress" = "4.15.43.74" ] || [ "$ipaddress" = "24.244.111.42" ];
	then
		curl -L -s `curl -L -s https://api.weather.gov/points/34.744,-92.270 -H "User-Agent:httpie-tspencer/1.0" | /usr/local/bin/jq '.properties.forecast' | sed 's/"//g'` -H "User-Agent:httpie-tspencer/1.0" | /usr/local/bin/jq '.properties.periods[] | "\(.name): \(.shortForecast) / \(.temperature)°f"' | sed 's/"//g' > /tmp/forecast.txt
	else
		curl -L -s `curl -L -s https://api.weather.gov/points/$geo -H "User-Agent:httpie-tspencer/1.0" | /usr/local/bin/jq '.properties.forecast' | sed 's/"//g'` -H "User-Agent:httpie-tspencer/1.0" | /usr/local/bin/jq '.properties.periods[] | "\(.name): \(.shortForecast) / \(.temperature)°f"' | sed 's/"//g' > /tmp/forecast.txt
fi

chmod 777 /tmp/forecast.txt