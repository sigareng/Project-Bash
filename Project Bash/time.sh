#!/bin/sh

DIALOG=${DIALOG=dialog}
USERTIME=`$DIALOG --stdout --title "TIMEBOX" --timebox "Please set the time..." 4 25`

case $? in
  0)
    echo "Time entered: $USERTIME.";;
  1)
    echo "Cancel pressed."
    case $? in
        pattern )
            ;;
    esac

    ;;
  255)
    echo "Box closed.";;
esac