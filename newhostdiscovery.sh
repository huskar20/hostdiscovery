#!/bin/bash

#1th value: IP ranges
#2nd value mail address to send

echo "....................."
echo "Host Discovery Script"
echo "......................"
#Test if there is any file named iplist and not empty. If there is a file named iplist then do host discovery only.
fileName="iplist"
preCountofIP=0
if [ -s iplist ]
	then
	preCountofIP=$(cat $fileName | wc -l)
	echo "$fileName file found in the folder, starting host discovery"
	fileName="tempfile"
	firstTime=0
else
	echo "This is the first discovery of IP addresses. All addresses will be written in $fileName file"
	firstTime=1
fi
#Starting host discovery through nmap scan
echo "Host discovery started!"
nmap -sP $2 | grep -Eo '[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}' > $fileName
countOfIP=$(cat $fileName | wc -l)
echo "Host discovery ended!"
echo "New inventory   :$countOfIP"
echo "Previosly       :$preCountofIP"
#Find the difference between files as to discover new hosts after the nmap scan.
discoveredHostsCount=$(($countOfIP-$preCountofIP))
echo "Discovered hosts: $discoveredHostsCount"
echo "Writing discovered hosts to a file"
grep -xvFf iplist $fileName > newhostsfound

#Sending Email
echo "Sending the email!"
m_to="$1"
m_subject="New discovered hosts for $(date +%x)"
if [ -s newhostsfound ]
	then
	m_body="New $discoveredHostsCount hosts have been discovered on $(date +%x). The list is attached to this email"
else
	m_body="There are no new hosts have been discovered on $(date +%x)."
fi

echo "$m_body" | mail -s "$m_subject" -a newhostsfound $m_to
#...........
#Email sending 
#echo "Sending the email"
echo "Email has been sent"

#Delete temp file and update inventory.
echo "Cleaning up the files"
mv -f $fileName iplist
rm newhostsfound
echo " END OF SCRIPT  "
