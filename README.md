# gridstarter

## install 

```bash
curl https://raw.githubusercontent.com/despiegk/gridstarter/main/scripts/install.sh > /tmp/install.sh && bash /tmp/install.sh

#if you want to debug do
curl https://raw.githubusercontent.com/despiegk/gridstarter/main/scripts/install.sh > /tmp/install.sh && bash -x /tmp/install.sh
```



## install on remote server over ssh

You need ssh-key loaded in ssh-agent

```bash
#add your ip addr here
export ME='195.192.213.92'

#do the install
ssh -A root@$ME "curl https://raw.githubusercontent.com/despiegk/gridstarter/main/scripts/install.sh > /tmp/install.sh && bash -x /tmp/install.sh"

#to login to your machine
ssh -A root@$ME

#to reset all (same as install but will restart)
ssh -A root@$ME "export RESET=1 && curl https://raw.githubusercontent.com/despiegk/gridstarter/main/scripts/install.sh > /tmp/install.sh && bash -x /tmp/install.sh"

```

## to get ansible as part of install

to install

```bash

export ANSIBLE=1 
curl https://raw.githubusercontent.com/despiegk/gridstarter/main/scripts/install.sh > /tmp/install.sh && bash /tmp/install.sh


#or remote
export ME='195.192.213.92'
ssh -A root@$ME "export ANSIBLE=1 && curl https://raw.githubusercontent.com/despiegk/gridstarter/main/scripts/install.sh > /tmp/install.sh && bash -x /tmp/install.sh"
```


to use

```bash
source /root/play/ansible/bin/activate
```

## info

- https://upcloud.com/resources/tutorials/get-started-wireguard-vpn
- https://www.wireguard.com/quickstart/

## our server

http://mail.lbndao.com:5000/status