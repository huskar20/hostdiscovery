# hostdiscover
If one set up as a cron job, the script can discover and email the given IP ranges to the network admin as to find out if new hosts showed up in the network. 

A detailed usage description will be provided soon...

For now usage is: 

newhostdiscovery.sh [Ip_address/Range Ip_address/Range] [email_address]

sample usage: ./newhostdiscovery.sh "10.10.10.0/24 10.10.10.1/24" "my@email.com"

Briefly, the script is using nmap scan to find out alive hosts....
