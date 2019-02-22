#!/bin/bash
#Script to add users. This script must be run as root.
#Author: Jarrett Melnick
#February 22, 2019

if [[$EUID -ne 0]]; then
	#First, check to see if I'm being run as root.
	echo "YOU MUST RUN ME AS ROOT!"
	exit 1
fi

while (("$#"));
#while I have inputs to the command line
do
	echo Creating user $1!
	`useradd $1`#Create the user
	`echo $1:passW0rd123 | chpasswd` #Change the password. [passW0rd123] is the default
	shift
done
