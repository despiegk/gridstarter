
macro how to install postgresql:

## state object


!!app.state.set name:'mypostgresql'
    id:""
    wish:"active"               #init, built, installed, configured, active, stopped
    state:"init"                #state as read from the reality init, built, installed, configured, active, error, stopped

## definition of the app object (params)

all arguments are optional

!!app.postgresql.define name:'mypostgresql'
    db.path:'/var/db/data'              
    unixsocket.path:'/var/db/socket'    
    tcp.port:5432                       
    db.passwd:'mysecret'                
    version:'15.1'                            
    nodes:'' #optional (nodes on which this needs to be executed)
    dependencies:'' #optional apps which need to be active before doing this one

## example how to deploy

!!app.deploy name:'mypostgresql'