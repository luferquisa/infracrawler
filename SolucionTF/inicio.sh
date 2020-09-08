#!/bin/sh
echo "Hello World.  The time is now $(date -R)!$(whoami)!" | tee /root/output.txt
iptables -I INPUT -p tcp -m tcp --dport 80 -j ACCEPT
mkdir /mnt/repositorio/
 sudo mount -o ro 10.0.0.5:/FileSystem-20200830-2350-21 /mnt/repositorio/
 
 wget http://localhost/apptest/trabajar.php