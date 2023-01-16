set -ex

for name in "1_base0" "2_rust0" "3_rustbuilder" "4_zinit" "5_gobuilder" "6_vbuilder" "7_nsc" "8_natstools"
do
    echo "START BUILDING $name"
    pushd $name
    bash build.sh
    popd
    echo "Welcome $i times"
done