set -ex
#install ansible
export ANSIBLE=1 
curl https://raw.githubusercontent.com/despiegk/gridstarter/main/scripts/install.sh > /tmp/install.sh && bash /tmp/install.sh

cd /root/code/github/despiegk/gridstarter/ansible/dns
source /root/play/ansible/bin/activate
ansible-galaxy install cloudalchemy.coredns
