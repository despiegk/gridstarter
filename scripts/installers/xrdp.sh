apt install xrdp -y 
apt install kde-plasma-desktop -y
usermod -a -G ssl-cert xrdp 
systemctl restart xrdp 
