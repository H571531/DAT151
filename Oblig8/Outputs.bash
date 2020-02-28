pi@adrianpi:~ $ sudo iptables -A INPUT -j DROP # Obviously I did this through SSH and lost connection

Pinging from 192.168.88.241 (Yes routing is working)
C:\Users\adria>ping 10.0.0.2

Pinging 10.0.0.2 with 32 bytes of data:
Request timed out.
Request timed out.
Request timed out.
Request timed out.

Ping statistics for 10.0.0.2:
    Packets: Sent = 4, Received = 0, Lost = 4 (100% loss),

	iptables -A INPUT -p tcp -s 192.168.88.241 --dport 22 -j ACCEPT
	iptables -A INPUT -p tcp -m tcp --dport 22 -j DROP
	
adrian@DESKTOP-2TP1O57:~$ ssh pi@10.0.0.2
pi@10.0.0.2s password:
Linux adrianpi.adrian.local 4.14.79-v7+ #1159 SMP Sun Nov 4 17:50:20 GMT 2018 armv7l

The programs included with the Debian GNU/Linux system are free software;
the exact distribution terms for each program are described in the
individual files in /usr/share/doc/*/copyright.

Debian GNU/Linux comes with ABSOLUTELY NO WARRANTY, to the extent
permitted by applicable law.
Last login: Fri Feb 28 00:46:45 2020 from 192.168.88.241
pi@adrianpi:~ $



pi@AdrianDC:~ $ ssh pi@10.0.0.2
ssh: connect to host 10.0.0.2 port 22: Connection timed out

pi@adrianpi:/FirewallRules $ sudo chmod 755 Firewall.sh
pi@adrianpi:/FirewallRules $ sudo crontab -e
crontab: installing new crontab
@reboot sudo /FirewallRules/Firewall.sh


Last login: Fri Feb 28 01:30:26 2020 from 192.168.88.241
pi@adrianpi:sudo iptables -S
sudo: klarte ikke å slå opp vertsnavn adrianpi.adrian.local
-P INPUT ACCEPT
-P FORWARD ACCEPT
-P OUTPUT ACCEPT
-A INPUT -s 192.168.88.241/32 -p tcp -m tcp --dport 22 -j ACCEPT
-A INPUT -p tcp -m tcp --dport 22 -j DROP
pi@adrianpi:~ $




# Task2 

[admo@EXAMPLE ~]$ getenforce
Enforcing

[admo@EXAMPLE ~]$ sestatus
SELinux status:                 enabled
SELinuxfs mount:                /sys/fs/selinux
SELinux root directory:         /etc/selinux
Loaded policy name:             targeted
Current mode:                   enforcing
Mode from config file:          enforcing
Policy MLS status:              enabled
Policy deny_unknown status:     allowed
Memory protection checking:     actual (secure)
Max kernel policy version:      31


[admo@EXAMPLE ~]$ sudo nano /etc/selinux/config
# This file controls the state of SELinux on the system.
# SELINUX= can take one of these three values:
#     enforcing - SELinux security policy is enforced.
#     permissive - SELinux prints warnings instead of enforcing.
#     disabled - No SELinux policy is loaded.
SELINUX=enforcing
# SELINUXTYPE= can take one of these three values:
#     targeted - Targeted processes are protected,
#     minimum - Modification of targeted policy. Only selected processes $
#     mls - Multi Level Security protection.
SELINUXTYPE=targeted

[admo@EXAMPLE ~]$ sudo semanage login -l

Login Name           SELinux User         MLS/MCS Range        Service

__default__          unconfined_u         s0-s0:c0.c1023       *
root                 unconfined_u         s0-s0:c0.c1023       *

semanage login controls the mapping between a Linux User and the SELinux User.  It can be used to turn  on confined users.  For example you could define that a particular user or group of users will login to a system as the user_u user.  Prefix the group name with a '%' sign to indicate a group name.


[admo@EXAMPLE ~]$ touch /tmp/setest


[admo@EXAMPLE ~]$ ls -Z /tmp/setest
unconfined_u:object_r:user_tmp_t:s0 /tmp/setest

[admo@EXAMPLE ~]$ chcon -t user_home_t /tmp/setest
[admo@EXAMPLE ~]$ ls -Z /tmp/setest
unconfined_u:object_r:user_home_t:s0 /tmp/setest

[admo@EXAMPLE ~]$ id -Z
unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023

[admo@EXAMPLE ~]$ ps axZ | grep httpd
unconfined_u:unconfined_r:unconfined_t:s0-s0:c0.c1023 14436 pts/2 R+   0:0                                   0 grep --color=auto httpd


[admo@EXAMPLE ~]$ ls -Z /etc/passwd
system_u:object_r:passwd_file_t:s0 /etc/passwd


[admo@EXAMPLE ~]$ sudo virt-install -n CentOsNoGraph -f /vm/CentNG.img,size=10 -l http://centos.uib.no/8-stream/BaseOS/x86_64/os -r 512 --nographics -x "ks=http://eple.hib.no/dat151/kvm_centos8.ks
"
WARNING  KVM acceleration not available, using 'qemu'
WARNING  No operating system detected, VM performance may suffer. Specify an OS with --os-variant for optimal results.

Starting install...
Retrieving file vmlinuz...                                                                                                                            | 7.8 MB  00:00:01
Retrieving file initrd.img...                                                                                                                         |  59 MB  00:00:10
Allocating 'CentNG.img'                                                                                                                               |  10 GB  00:00:00
Connected to domain CentOsNoGraph
