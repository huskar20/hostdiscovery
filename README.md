# hostdiscovery
If one set up as a cron job, the script can discover and email the given IP ranges to the network admin as to find out if new hosts showed up in the network. 

A detailed usage description will be provided soon...

For now usage is: 

newhostdiscovery.sh [email_address] [Ip_address/Range Ip_address/Range] 

sample usage: ./newhostdiscovery.sh "example@sampleemail.com" "10.10.10.0/24 10.10.10.1/24"

Briefly, the script is using nmap scan to find out alive hosts then sending email to the network administrator's email address you provide as the first parameter while script execution. For the first scan script creating a file named "iplist", and inserting all the IP addresses into this file. When the script runs again it compares and updates this file with the latest inventory. The main goal is to increase awareness by setting this as a cron job to discover new hosts on your network. 
### There are some bugs to fix. TODO
