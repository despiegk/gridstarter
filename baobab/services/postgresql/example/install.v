module main

import freeflowuniverse.crystallib.appsbox.postgresapp

fn do() ! {
	mut app := postgresapp.get("
	    db.path:'/var/db/data'              
		unixsocket.path:'/var/db/socket'    
		tcp.port:5432                       
		db.passwd:'mysecret'                
		version:'15.1'                   
		name:'mypostgres'   
	")

	app.install()!

}

fn main() {
	do() or { panic(err) }
}
