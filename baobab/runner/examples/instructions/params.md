
macro how to install postgresql:


## definition of the app object (params)

all arguments are optional

!!app.postgresql.build
    version:'15.1'   

!!app.caddy.build
    version:'2.6.2'

!!app.postgresql.define 
    instance:'mypostgresql'
    db.path:'/var/db/data'              
    unixsocket.path:'/var/db/socket'    
    tcp.port:5432                       
    db.passwd:'mysecret'                

!!app.caddy.define 
    instance:'caddy1'
   

!!app.caddy.site.add 
    instance:'caddy1_default'
    path:'/var/www'
    http.port:8080
    https.port:8081


## example how to deploy

!!solution.deploy 
    name:'mypostgresql' 
    dependencies:'caddy1_default,mypostgresql'

