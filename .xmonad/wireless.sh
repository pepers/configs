#!/bin/sh


iwconfig mlan0 2>&1 | grep -q no\ wireless\ extensions\. && {
  echo wired
  exit 0
}

essid=`sudo iwconfig mlan0 | awk -F '"' '/ESSID/ {print $2}'`
stngth=`sudo iwconfig mlan0 | awk -F '=' '/Quality/ {print $2}' | cut -d '/' -f 1`

if [ -z $stngth ] 
  then
    result='Net: !!'
  else
    result=$essid': '$stngth'%'
fi

echo $result

exit 0
