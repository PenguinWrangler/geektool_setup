#!/bin/bash

curl wttr.in/?format="%l+%c+%C+%t+%w+%p" | sed 's/, United States /\'$'\n/g'