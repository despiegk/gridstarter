set -e

export OURHOME="$HOME/play"
mkdir -p $OURHOME

function github_keyscan {
    mkdir -p ~/.ssh
    if ! grep github.com ~/.ssh/known_hosts > /dev/null
    then
        ssh-keyscan github.com >> ~/.ssh/known_hosts
    fi
}

function os_update {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then 
        apt update
        apt upgrade -y
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        echo 
    fi
}

function redis_install {
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then 
        apt install libssl-dev redis -y
        /etc/init.d/redis-server start
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        if ! [ -x "$(command -v redis-server)" ]; then
            brew install redis
        fi
        brew services start redis
    fi
}

function crystal_lib_get {
    mkdir -p $DIR_CODE/github/freeflowuniverse
    if [[ -d "$DIR_CODE/github/freeflowuniverse/crystallib" ]]
    then
        pushd $DIR_CODE/$2 2>&1 >> /dev/null
        # git pull
        popd 2>&1 >> /dev/null
    else
        pushd $DIR_CODE/github/freeflowuniverse 2>&1 >> /dev/null
        git clone --depth 1 --no-single-branch git@github.com:freeflowuniverse/crystallib.git
        popd 2>&1 >> /dev/null
    fi
    if [[ -z "${CLBRANCH}" ]]; then 
        echo ' - no branch set'
    else
        if [[ "$CLBRANCH" == "development" ]]; then 
            echo
        else
            echo ' - switch to branch ${CLBRANCH} for crystallib'
            pushd $DIR_CODE/github/freeflowuniverse/crystallib 2>&1 >> /dev/null
            git checkout $CLBRANCH
            git pull
            popd 2>&1 >> /dev/null
        fi
    fi
}

function gridstarter_get {
    mkdir -p $DIR_CODE/github/despiegk
    if [[ -d "$DIR_CODE/github/despiegk/gridstarter" ]]
    then
        pushd $DIR_CODE/$2 2>&1 >> /dev/null
        git pull
        popd 2>&1 >> /dev/null
    else
        pushd $DIR_CODE/github/despiegk 2>&1 >> /dev/null
        git clone --depth 1 --no-single-branch git@github.com:despiegk/gridstarter.git
        popd 2>&1 >> /dev/null
    fi
}




# function crystal_tools_get {
#     mkdir -p $DIR_CODE/github/freeflowuniverse
#     if [[ -d "$DIR_CODE/github/freeflowuniverse/crystaltools" ]]
#     then
#         pushd $DIR_CODE/$2 2>&1 >> /dev/null
#         # git pull
#         popd 2>&1 >> /dev/null
#     else
#         pushd $DIR_CODE/github/freeflowuniverse 2>&1 >> /dev/null
#         git clone --depth 1 --no-single-branch https://github.com/freeflowuniverse/crystaltools.git
#         popd 2>&1 >> /dev/null
#     fi
#     if [[ -z "${CLBRANCH}" ]]; then 
#     echo ' - no branch set'
#     else
#         if [[ "$CLBRANCH" == "development" ]]; then 
#             echo
#         else
#             echo ' - switch to branch ${CLBRANCH} for publishtools'
#             pushd $DIR_CODE/github/freeflowuniverse/crystaltools 2>&1 >> /dev/null
#             git checkout $CLBRANCH
#             git pull
#             popd 2>&1 >> /dev/null
#         fi
#     fi
# }


#important to first remove
rm -f $OURHOME/env.sh

if [[ -f "env.sh" ]]; then 
    #means we are working from an environment where env is already there e.g. when debug in publishing tools itself
    ln -sfv $PWD/env.sh $OURHOME/env.sh 
    if [[ -d "/workspace" ]]
    then
        ln -sfv $PWD/env.sh /workspace/env.sh 
    fi
else
    curl https://raw.githubusercontent.com/despiegk/gridstarter/main/scripts/env.sh > $OURHOME/env.sh
    if [[ -d "/workspace" ]]
    then
        cp $OURHOME/env.sh /workspace/env.sh 
    fi
    cp $OURHOME/env.sh $HOME/env.sh 
fi

bash -e $OURHOME/env.sh
source $OURHOME/env.sh

github_keyscan

if [[ -z "${RESET}" ]]; then
  echo
else
  rm -f $HOME/.vmodules/done_crystallib
fi


#CHECK IF DIR EXISTS, IF NOT CLONE
if ! [[ -f "$HOME/.vmodules/done_crystallib" ]]; then

    os_update
    
    redis_install

    sudo rm -rf ~/.vmodules/freeflowuniverse/
    mkdir -p ~/.vmodules/despiegk/    

    crystal_lib_get

    gridstarter_get

    touch "$HOME/.vmodules/done_crystallib"
fi




function v_install {
    set -e
    if [[ -z "${DIR_CODE_INT}" ]]; then 
        echo 'Make sure to source env.sh before calling this script.'
        exit 1
    fi


    if [ -d "$HOME/.vmodules" ]
    then
        if [[ -z "${USER}" ]]; then
            sudo chown -R $USER:$USER ~/.vmodules
        else
            USER="$(whoami)"
            sudo chown -R $USER ~/.vmodules
        fi
    fi


    if [[ -d "$DIR_CODE_INT/v" ]]; then
        pushd $DIR_CODE_INT/v
        git pull
        popd "$@" > /dev/null
    else
        mkdir -p $DIR_CODE_INT
        pushd $DIR_CODE_INT
        sudo rm -rf $DIR_CODE_INT/v
        if [[ "$OSTYPE" == "linux-gnu"* ]]; then 
            sudo apt update
            sudo apt install libgc-dev gcc make -y
        elif [[ "$OSTYPE" == "darwin"* ]]; then
            brew install bdw-gc
        else
            echo "ONLY SUPPORT OSX AND LINUX FOR NOW"
            exit 1
        fi    
        git clone https://github.com/vlang/v
        popd "$@" > /dev/null
    fi

    pushd $DIR_CODE_INT/v
    make
    if [[ "$OSTYPE" == "linux-gnu"* ]]; then 
        sudo ./v symlink
    elif [[ "$OSTYPE" == "darwin"* ]]; then
        ./v symlink
    fi
    popd "$@" > /dev/null

    if ! [ -x "$(command -v v)" ]; then
    echo 'vlang is not installed.' >&2
    exit 1
    fi
}


if ! [ -x "$(command -v v)" ]; then
  v_install
fi

# pushd $DIR_CT
# git pull
# popd "$@" > /dev/null

# if [[ -f "$HOME/.vmodules/done_crystallib" ]]; then
# pushd ~/.vmodules/despiegk/crystallib
# git pull
# popd "$@" > /dev/null
# fi

# # ct_reset
# ct_build
# build
# clear
# ct_help

echo "**** INSTALL WAS OK ****"

