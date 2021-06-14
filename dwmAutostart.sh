#! /bin/bash

feh --bg-scale ~/pics/sunsetdunes.jpg


while true; do

        xsetroot -name "$(acpi -t | awk '{print $4}') | $(date '+%Y-%m-%d %H:%M')"
        sleep 1m


done
