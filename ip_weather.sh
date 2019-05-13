#!/bin/bash

ip="$(curl -s ifconfig.co)"

if [ "$ip" = "4.15.43.74" ] || [ "$ip" = "24.244.111.42" ];
	then
		echo "Little Rock, AR" & curl --header "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X)" --silent "https://www.accuweather.com/en/us/little-rock-ar/72201/weather-forecast/31269_pc" | awk -F\' '/acm_RecentLocationsCarousel\.push/{print substr($13,10,25)", "$10"°" }'| sed 's/"});//' | head -1
 else
		if [[ "$ip" = *"50"* ]] || [[ "$ip" = "69.29.4.82" ]];
			then
				echo "Cabot, AR" & curl --header "User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X)" --silent "https://www.accuweather.com/en/us/cabot-ar/72023/weather-forecast/31139_pc" | awk -F\' '/acm_RecentLocationsCarousel\.push/{print substr($13,10,25)", "$10"°" }'| sed 's/"});//' | head -1
	else echo "No Location Available"
		fi
fi
