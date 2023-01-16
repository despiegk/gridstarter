set -ex

for name in "base" "zinit" "basezinit" "golang" "rust" "vlang"
echo "START BUILDING $name"
    pushd $name
    bash build.sh
    popd
do
   echo "Welcome $i times"
done