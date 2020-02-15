##Running this example on 2 raspberry pi micro computers running a debian based OS (Raspbian) 
## Server side
$ sudo apt-get install nfs-kernel-server -y
$ sudo chown -R pi:pi /home/
$ sudo find /home/ -type d -exec chmod 755 {} \;
$ sudo find /home/ -type f -exec chmod 644 {} \;
$ id pi
uid=1000(pi) gid=1000(pi) grupper=1000(pi),4(adm),20(dialout),24(cdrom),27(sudo),29(audio),44(video),46(plugdev),60(games),100(users),105(input),109(netdev),999(spi),998(i2c),997(gpio)
$ sudo nano /etc/exports
$ sudo exportfs -ra
$ hostname -I
10.0.0.6
$ sudo update-rc.d rpcbind enable
$ sudo service rpcbind restart


## Client
$ id pi
uid=1000(pi) gid=1000(pi) grupper=1000(pi),4(adm),20(dialout),24(cdrom),27(,29(audio),44(video),46(plugdev),60(games),100(users),101(input),108(netdev(spi),998(i2c),997(gpio)
$ sudo mkdir -p /mnt/nfs
$ sudo chown -R pi:pi /mnt/nfs/
$ sudo mount 10.0.0.6:/home/ /mnt/nfs/
$ sudo nano /etc/fstab ##To make the client auto connect and mount to the server
(added: 10.0.0.6:/home/   /mnt/nfs   nfs    rw  0  0 )
$ cd /mnt/nfs/
$ ls
pi
pi@adrianpi:/mnt/nfs $ cd pi
pi@adrianpi:/mnt/nfs/pi $ ls
Desktop    Downloads  Music     Public     Videos
Documents  MagPi      Pictures  Templates


##Testing (AdrianPI client) (AdrianDC Server)

pi@adrianpi:/mnt/nfs/pi $ touch Hei.txt
pi@adrianpi:/mnt/nfs/pi $ ls -al | grep Hei.txt
-rw-r--r--  1 pi pi    0 feb.   7 10:57 Hei.txt

pi@AdrianDC:~ $ ls -al | grep Hei.txt
-rw-r--r--  1 pi pi    0 feb.   7 10:57 Hei.txt


##LVM
$sudo pvcreate /dev/sdb1 /dev/sdb2 /dev/sdb3 /dev/sdb4
$sudo vgdisplay
#shows each of the partitions as separate units. 

$sudo vgcreate vGroup /dev/sdb1 /dev/sdb2 /dev/sdb3 /dev/sdb4
 Volume group "vGroup" successfully created
 
 
##Logging

#Local logging
$sudo nano /etc/rsyslog.conf

#added this line:
auth.debug /var/log/auth.log
#This adds the logs from the authentication process like login. 

#uncommented these lines to allow for connection
module(load="imudp")
input(type="imudp" port="514")
module(load="imtcp")
input(type="imtcp" port="514")

#then I did a restart of the service
$sudo systemctl restart rsyslog

$sudo nano /etc/rsyslog.conf
#Added this to the bottom of the file (10.0.0.2 is the ip of the server)
*.* @@10.0.0.2:514
$sudo nano /etc/rsyslog.d/10-rsyslog.conf
#Added this to the file I created:
*.* @@10.0.0.2:514
#restarting server
$sudo systemctl restart rsyslog

Now adding this to the client will send the logs for authentication to the server:

auth.* @@10.0.0.2:514
