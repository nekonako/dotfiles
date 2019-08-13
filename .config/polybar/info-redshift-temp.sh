#!/bin/sh

if [ "$(pgrep -x redshift)" ]; then
    temp=$(redshift -p 2> /dev/null | grep temp | cut -d ":" -f 2 | tr -dc "[:digit:]")

    if [ -z "$temp" ]; then
        echo "%{F#65737E} # "
    elif [ "$temp" -ge 4700 ]; then
        echo " LIGHT MODE "
    elif [ "$temp" -ge 4500 ]; then
        echo " NIGHT MODE "
    else
        echo "%{F#D08770} # "
    fi
fi
