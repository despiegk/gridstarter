set -ex
mkdir -p /var/www

curl https://sh.rustup.rs -sSf | sh

cd /var/www
git clone git@github.com:ourworld-tsc/www_ournomads.git
cd www_ournomads
bash build.sh

# npm install
# npm run start

#https://github.com/ourworld-tsc/www_ournomads