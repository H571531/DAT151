#!/bin/bash
iptables -A INPUT -p tcp -s 192.168.88.241 --dport 22 -j ACCEPT
iptables -A INPUT -p tcp -m tcp --dport 22 -j DROP