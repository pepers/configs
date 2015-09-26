#!/bin/bash
str=`amixer sget Master,0`
str1=${str#Simple*\[}
v1=${str1%%]*]}
il=`expr index "$str1" [`
o="off"
s=${str1:0:1}
str2=${str1#${str1:0:1}*\[}
str1=$str2
str2=${str1#${str1:0:1}*\[}
ir=`expr index "$str2" [`
v2=${str2%%]*]}
v=${v1}\ $mutel
echo $v
