set -ex
# ansible-playbook playbook.yml -f 10
# ansible-playbook -i hosts -k playbook.yml
# ansible-playbook --connection=local --inventory 127.0.0.1, playbook.yml


cd /root/code/github/despiegk/gridstarter/poc/1_dns
source /root/play/ansible/bin/activate

ansible-playbook playbook.yml

# nslookup ebisu.example.com localhost
nslookup test.refit.earth localhost

