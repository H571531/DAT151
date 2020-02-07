
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
