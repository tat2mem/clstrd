echo "PermitRootLogin prohibit-password" >> /etc/ssh/sshd_config
rc-service sshd restart

wget https://raw.githubusercontent.com/tat2mem/clstrfkd/master/ssh/authorized_keys -O .ssh/authorized_keys
wget https://raw.githubusercontent.com/tat2mem/clstrfkd/master/ssh/id_rsa -O .ssh/id_rsa

apk add -u awall
wget https://raw.githubusercontent.com/tat2mem/clstrfkd/master/awall/firewall-main.json -O /etc/awall/optional/firewall-main.json
wget https://raw.githubusercontent.com/tat2mem/clstrfkd/master/awall/ping.json -O /etc/awall/optional/ping.json
wget https://raw.githubusercontent.com/tat2mem/clstrfkd/master/awall/ssh.json -O /etc/awall/optional/ssh.json

awall enable firewall-main
awall enable ping
awall enable ssh
awall activate

apk add -u dhcp
wget https://raw.githubusercontent.com/tat2mem/clstrfkd/master/dhcp/dhcpd.conf -O /etc/dhcp/dhcpd.conf

rc-update add dhcpd
rc-service dhcpd start
rc-service dhcpd restart