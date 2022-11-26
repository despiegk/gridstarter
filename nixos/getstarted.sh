set -ex

cd /tmp
git clone --depth 1 --branch zdb git@github.com:maxux/nixpkgs.git

cd /root
git clone --depth 1 --branch zdb git@github.com:maxux/nixpkgs.git
# git clone --depth 1 git@github.com:NixOS/nixpkgs.git

rsync -ravd /tmp/nixpkgs/pkgs/servers/zdb/ /root/nixpkgs/pkgs/servers/zdb/
rsync -ravd /tmp/nixpkgs/nixos/modules/services/networking/zdb.nix /root/nixpkgs/nixos/modules/services/networking/zdb.nix

#two commands for nixos-rebuild
nixos-rebuild switch
nixos-rebuild -I nixpkgs=~/nixpkgs switch

#-d deletes old generations too
nix-collect-garbage -d


mkdir -p /root/flakes/services/networking
mkdir -p /root/flakes/zdb
rsync -ravd /tmp/nixpkgs/pkgs/servers/zdb/ /root/flakes/zdb/
rsync -ravd /tmp/nixpkgs/nixos/modules/services/networking/zdb.nix  /root/flakes/services/networking/zdb.nix

