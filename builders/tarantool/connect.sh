# ssh-add -L > ~/myhost/authorized_keys
docker rm builder_tarantool -f 2>&1 >> /dev/null
mkdir -p $HOME/myhost
docker run -d --name builder_tarantool -it -v $HOME/myhost:/myhost --hostname builder_tarantool builder_tarantool

docker exec -ti builder_tarantool /bin/sh




    # -p 5000:22 \

    # -v /run/host-services/ssh-auth.sock:/run/host-services/ssh-auth.sock -e SSH_AUTH_SOCK="/run/host-services/ssh-auth.sock" \

#UGLY HACK to remove known hosts file 
# rm -f ~/.ssh/known_hosts
# sleep 0.6

# if [ "$1" ]; then
#     exit 0
# else
#     ssh -A -o "StrictHostKeyChecking=no" root@localhost -p 5000
# fi

