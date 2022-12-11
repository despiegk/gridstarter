module postgresql

import os
// import freeflowuniverse.crystallib.builder
// import freeflowuniverse.crystallib.params
import freeflowuniverse.baobab.appsbox


struct Config {
	name             string
	tcp_port         int
	db_path			 string
	unixsocket_path  string
	postgres_passwd  string
	version			 string
}


// db.path:'/var/db/data'              
// unixsocket.path:'/var/db/socket'    
// tcp.port:5432                       
// db.passwd:'mysecret'                
// db.version:'15.1'                   
// name:'mypostgres'                 
// nodes:'' #optional (nodes on which this needs to be executed)
// dependencies:'' #optional (names from apps which need to be in certain state)
pub fn config(mut app appsbox.App)!Config {

	mut params0 := app.params

	mut config:=Config{
		tcp_port: params0.get_int_default("tcp.port", 0)!
		db_path: params0.get_default("db.path", "")!
		unixsocket_path: params0.get_default("unixsocket.path", "")!
		postgres_passwd: params0.get_default("db.passwd", "")!
	}

	return config

}

pub fn build(mut app appsbox.App)! {


	if app.build_state == .ok {
		return
	}

 
	mut node := app.apps.node_get(app.name)!

	postgres_path:="${app.apps.paths.base.path}/postgresql"
	version:= app.params.get_default("version", "15.1")!

	mut cmd := $tmpl('templates/postgres_build.sh')
	node.exec(cmd) or { return error('Cannot build mdbook.\n$err') }

	app.build_state = .ok


	if true{
		println(cmd)
		println(app.params)
		panic("sfsfdf")
	}

	app.save()!

}

pub fn install(mut app appsbox.App)! {


	if app.install_state == .ok {
		return
	}

 
	mut node := app.apps.node_get(app.name)!

	postgres_path:="${app.apps.paths.base.path}/postgresql"
	version:= app.params.get_default("version", "15.1")!

	mut cmd := $tmpl('templates/postgres_build.sh')
	node.exec(cmd) or { return error('Cannot build mdbook.\n$err') }

	app.install_state 	= .ok


	if true{
		println(cmd)
		panic("sfsfdf")
	}

	//app.save()!

}


// pub fn (mut app MyApp) init(params_text string)  {

// pub fn (mut myapp PostgresApp) start() ? {
// 	mut factory := appsbox.get()

// 	myapp.install(false)?

// 	mut tcpport := myapp.appconfig.tcpports[0]
// 	bin_path := factory.bin_path

// 	// set a start command for postgresql
// 	cmd := '$bin_path/postgres_start'
// 	n.exec(cmd: cmd, reset: true, description: 'start postgresql', stdout: true)?
// 	alive := myapp.check()?
// 	if !alive {
// 		return error('Could not start postgresql.')
// 	}
// }

// pub fn (mut myapp PostgresApp) stop() ? {
// 	mut factory := appsbox.get()
// 	mut bin_path := appsbox.get().bin_path
// 	mut n := builder.node_local()?
// 	tcpport := myapp.appconfig.tcpports[0]
// 	var_path := factory.var_path + '/postgresql'

// 	cmd := '$bin_path/pg_ctl stop -D $var_path'
// 	n.exec(cmd: cmd, reset: true, description: 'stop postgresql', stdout: true)?
// }

// pub fn (mut myapp PostgresApp) install(reset bool) ? {
// 	mut factory := appsbox.get()

// 	mut n := builder.node_local()?
// 	myapp.appconfig.bins = ['postgresql', 'postgres_start']

// 	// check app is installed, if yes don't need to do anything
// 	if reset || !myapp.appconfig.exists() {
// 		myapp.build()?
// 	}

// 	tcpport := myapp.appconfig.tcpports[0]
// 	postgres_path := '$factory.apps_path'
// 	sysconfdir := postgres_path
// 	bin_path := factory.bin_path
// 	var_path := factory.var_path + '/postgresql'
// 	lib_dir := '$postgres_path/lib/postgresql'
// 	user := os.user_os()

// 	if !os.exists(var_path) {
// 		// means we need to init a DB
// 		cmd := "$bin_path/initdb -D '$var_path' --username=root"
// 		n.executor.exec_silent(cmd)?
// 	}

// 	// need to set  DYLD_LIBRARY_PATH to make sure if we build on other machine with different dir it still works
// 	// other way: ./pg_ctl -D /tmp/postgres2 -l logfile start
// 	cmd_start := "export DYLD_LIBRARY_PATH=$lib_dir/lib; $bin_path/postgresql -D '$var_path'"
// 	n.executor.file_write('$bin_path/postgres_start', cmd_start)?

// 	mut postgres_conf := $tmpl('postgresql.conf')
// 	n.executor.file_write('$var_path/postgresql.conf', postgres_conf)?
// 	n.executor.exec_silent('chmod 770 $bin_path/postgres_start')?

// 	// TODO: now need to set root user and passwd, make sure security is all tight
// 	// SEE postgres_passwd
// }

// pub fn (mut myapp PostgresApp) build() ? {
// 	mut factory := appsbox.get()
// 	mut n := builder.node_local()?
// 	tcpport := myapp.appconfig.tcpports[0]
// 	postgres_path := '$factory.apps_path'
// 	mut cmd := $tmpl('postgres_build.sh')
// 	mut tmpdir := '/tmp/postgresql'
// 	n.exec(
// 		cmd: cmd
// 		reset: true
// 		description: 'install postgresql ; echo ok'
// 		stdout: true
// 		tmpdir: tmpdir
// 	)?
// }

// // create database, give admin user (postgresql) all rights
// pub fn (mut myapp PostgresApp) create_db(db_name string) ? {
// 	mut factory := appsbox.get()
// 	mut n := builder.node_local()?
// 	bin_path := factory.bin_path

// 	cmd := '$bin_path/createdb --username=root $db_name'
// 	n.executor.exec_silent(cmd)?
// }

// // export database to path (use compression)
// pub fn (mut myapp PostgresApp) export_db(db_name string, path string) ? {
// 	mut factory := appsbox.get()
// 	mut n := builder.node_local()?
// 	bin_path := factory.bin_path

// 	cmd := '$bin_path/pg_dump -Fc --username=root -Z6 -v --dbname=$db_name -f $path'
// 	n.executor.exec_silent(cmd)?
// }

// // import db, drop before import
// pub fn (mut myapp PostgresApp) import_db(db_name string, path string) ? {
// 	mut factory := appsbox.get()
// 	mut n := builder.node_local()?
// 	bin_path := factory.bin_path

// 	cmd := '$bin_path/pg_restore --username=root --dbname=$db_name $path'
// 	n.executor.exec_silent(cmd)?
// }

// // checks postgresql is answering
// pub fn (mut myapp PostgresApp) check() ?bool {
// 	// TODO:
// 	// mut postgrescl := ...
// 	// result := postgrescl.ping()?	
// 	// if result=="PONG"{
// 	// 	return true
// 	// }
// 	// panic(result)
// 	return false
// }

// pub fn (mut myapp PostgresApp) client() ? {
// 	// mut tcpport := myapp.appconfig.tcpports[0]
// 	// return postgresclient.get("/tmp/postgres_${tcpport}.sock")
// }
