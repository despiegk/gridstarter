
## show state   

```
wg

interface: wg0
  public key: hGqSM35J0LtSZtdM9xH+L8eIV/6qWFQv5wI+t6e/hTw=
  private key: (hidden)
  listening port: 51820

peer: P7m1ZFcwRLsOtXFhLoq1aN16rgF8aHSU6iewqO88Zjc=
  preshared key: (hidden)
  allowed ips: 10.0.0.2/32
```

## quick

```
wg-quick start wg0
wg-quick down wg0

wg show


```

don't forget to apply config on the UI of VPN and then reload with above.

## config file

```
mcedit  /etc/wireguard/wg0.conf
```

```
# Address updated at:     2022-12-08 04:00:18.51215813 +0000 UTC
# Private Key updated at: 2022-12-08 03:35:36.252585413 +0000 UTC
[Interface]
Address = 10.0.0.1/24
ListenPort = 51820
PrivateKey = sdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsdsds=
MTU = 1420
PostUp = iptables -A FORWARD -i wg0 -j ACCEPT; iptables -t nat -A POSTROUTING -o ens4 -j MASQUERADE
PostDown = iptables -D FORWARD -i wg0 -j ACCEPT; iptables -t nat -D POSTROUTING -o ens4 -j MASQUERADE


# ID:           ce8m3hvu22a7s7rgj50g
# Name:         kds
# Email:........
# Created at:   2022-12-08 04:02:15.478184002 +0000 UTC
# Update at:    2022-12-08 04:02:15.478184002 +0000 UTC
[Peer]
PublicKey = P7m1ZFcwRLsOtXFhLoq1aN16rgF8aHSU6iewqO88Zjc=
PresharedKey = u8StWjvIg39623QFYn/jsCPuR0gtCPpO1swsrovTrmQ=
AllowedIPs = 10.0.0.2/32

```

ens4 is the interface connecting to internet

## tocheck my ip addr

see https://www.whatismyip.com/

