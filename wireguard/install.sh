set -ex
apt install wireguard -y
rm -f /tmp/wireguard-ui.tar.gz
curl -L https://github.com/ngoduykhanh/wireguard-ui/releases/download/v0.4.0/wireguard-ui-v0.4.0-linux-amd64.tar.gz -o /tmp/wireguard-ui.tar.gz
cd /tmp
tar -xvzf wireguard-ui.tar.gz


ufw allow ssh
ufw allow 51820/udp

# ufw enable

cd /etc/wireguard
umask 077
wg genkey | tee privatekey | wg pubkey > publickey

mcedit /etc/wireguard/wg0.conf

#https://upcloud.com/resources/tutorials/get-started-wireguard-vpn

[Interface]
PrivateKey = <contents-of-server-privatekey>
Address = 10.0.0.1/24
PostUp = iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o ens4 -j MASQUERADE
PostDown = iptables -D FORWARD -i wg0 -j ACCEPT; iptables -t nat -D POSTROUTING -o ens4 -j MASQUERADE
ListenPort = 51820

[Peer]
PublicKey = <contents-of-client-publickey>
AllowedIPs = 10.0.0.2/32