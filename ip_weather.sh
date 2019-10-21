#!/bin/bash

ipaddress="$(curl -s ifconfig.co)"
geo="$(curl -s https://tools.keycdn.com/geo.json?host=$ipaddress | sed 's/.*latitude":\(.*\),"metro_code".*/\1/' | tr -d '"longitude":')"
city="$(curl -s https://tools.keycdn.com/geo.json?host=$ipaddress | sed 's/.*city":\(.*\),"postal_code".*/\1/' | tr -d '""')"

echo $city
curl wttr.in/?format="%l+%c+%C+%t+%w+%p" | sed 's/, United States /\'$'\n/g'