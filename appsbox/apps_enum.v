module appsbox


// import freeflowuniverse.crystallib.gridstarter.postgresql

// type MyApp = postgresql.

    // wish:"active"               #init, built, installed, configured, active, stopped
    // state:"init"                #state as read from the reality init, built, installed, configured, active, error, stopped

enum AppWish{
	init
	built
	installed
	configured
	active
	stopped
}

enum AppState{
	init 	//means ready to be started
	built	//means has been built	
	installed //means has been installed
	configured
	active
	error
	stopped
}