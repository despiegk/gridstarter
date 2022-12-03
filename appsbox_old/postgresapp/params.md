
macro how to install postgresql:

## this is the generic object of an app

!!app.state.define
    state:"init" ##can be init, scheduled, active, error, ok   links to the state of the actionrunner
    id:""
    params:"" //is the text representation of the params below


## definition of the app object (params)

all arguments are optional

!!app.postgresql.params
    db.path:'/var/db/data'              
    unixsocket.path:'/var/db/socket'    
    tcp.port:5432                       
    db.passwd:'mysecret'                
    db.version:'15.1'                   
    name:'mypostgresql'                 
    nodes:'' #optional (nodes on which this needs to be executed)
    dependencies:'' #optional (id's from action's which need to be run before this)

## example how to deploy

!!app.deploy name:'mypostgresql'