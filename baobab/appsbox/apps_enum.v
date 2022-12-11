module appsbox


// import freeflowuniverse.crystallib.gridstarter.postgresql

// type MyApp = postgresql.

    // wish:"active"               #init, built, installed, configured, active, stopped
    // state:"init"                #state as read from the reality init, built, installed, configured, active, error, stopped

// pub enum AppWish{
// 	build	
// 	install
// 	start
// 	stop
// 	delete
// }


pub enum State{
	init
	running
	ok
	error
	stopped
}
