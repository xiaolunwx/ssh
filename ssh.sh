#!/bin/bash 
# wangxingxing 
#2016 

yum  update -y 
yum install gcc*  vim  net-tools  lsof openssl-devel telnet  zlib-devel  automake autoconf libtool make yum-utils   -y 
systemctl stop firewalld 
systemctl disable  firewalld

#sshd_config 
#sed -i 's/#Port 22/Port 8022/g'  /etc/ssh/sshd_config 
sed -i 's/PermitRootLogin yes/PermitRootLogin no/g'  /etc/ssh/sshd_config 
sed -i 's/PasswordAuthentication yes/PasswordAuthentication no/g'  /etc/ssh/sshd_config
sed -i 's/#RSAAuthentication yes/RSAAuthentication yes/g'  /etc/ssh/sshd_config
sed -i 's/#PubkeyAuthentication yes/PubkeyAuthentication yes/'  /etc/ssh/sshd_config
systemctl restart sshd 

#sudoers 
#sed  -i  '/# %wheel/aljt     ALL=\(ALL\)       NOPASSWD: ALL'  /etc/sudoers

# vpc network 
# https://help.aliyun.com/knowledge_detail/38776.html
sed -i 's/net.ipv4.ip_forward = 0/net.ipv4.ip_forward = 1/g' /etc/sysctl.conf

#vpc   iptables 
#iptables -t nat -I POSTROUTING -s 172.16.0.0/24 -j SNAT --to-source 172.16.0.1  


#jdk  install  
#mkdir /application  
#cd /opt 
#tar xvf jdk-8u102-linux-x64.tar.gz -C /application 
#ln -s /application/jdk1.8.0_102/  /usr/local/jdk 


# es   delete 
#curl -XDELETE 'http://172.16.1.16:9200/logstash-2013.03.*'  



