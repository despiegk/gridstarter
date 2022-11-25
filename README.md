# gridstarter

```
curl https://raw.githubusercontent.com/despiegk/gridstarter/main/scripts/install.sh > /tmp/install.sh && bash /tmp/install.sh

#if you want to debug do
curl https://raw.githubusercontent.com/despiegk/gridstarter/main/scripts/install.sh > /tmp/install.sh && bash -x /tmp/install.sh

# to run over ssh

#add your ip addr here
export ME='195.192.213.92'
ssh -A root@$ME "curl https://raw.githubusercontent.com/despiegk/gridstarter/main/scripts/install.sh > /tmp/install.sh && bash -x /tmp/install.sh && source /root/env.sh && /bin/bash"

#to reset all
ssh -A root@$ME "export RESET=1 && curl https://raw.githubusercontent.com/despiegk/gridstarter/main/scripts/install.sh > /tmp/install.sh && bash -x /tmp/install.sh && source /root/env.sh && /bin/bash"

```

