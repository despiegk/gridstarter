
macro how to install postgresql:

## state object


!!app.state.set
    id:""
    wish:"active"               #active, stopped, build, delete
    state:"init"                #state as read from the reality init, scheduled, building, installing, ok, error

## definition of the app object (params)

all arguments are optional

!!app.postgresql.params
    db.path:'/var/db/data'              
    unixsocket.path:'/var/db/socket'    
    tcp.port:5432                       
    db.passwd:'mysecret'                
    version:'15.1'                   
    name:'mypostgresql'                 
    nodes:'' #optional (nodes on which this needs to be executed)
    dependencies:'' #optional (id's from action's which need to be run before this)

## example how to deploy

!!app.deploy name:'mypostgresql'