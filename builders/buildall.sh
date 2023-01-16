set -ex

for name in "base" "zinit" "basezinit" "golang" "rust" "vlang" 
do
    echo "START BUILDING $name"
    pushd $name
    bash build.sh
    popd
    echo "Welcome $i times"
done