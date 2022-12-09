module appsbox

import os
import freeflowuniverse.crystallib.pathlib
import freeflowuniverse.crystallib.params

// [heap]
// pub interface App {
// mut:
// 	start() ?
// 	stop() ?
// 	install(bool) ?
// 	build() ?
// 	check() ?bool
// }

[heap]
pub struct StaticPath {
	from string
	to string
}

[heap]
pub struct BinPath {
	from string			//path in the build dir
	to 	 string			//path in the app dir
	name string		//name of the binary in  ~/hub/bin/$name
}

[heap]
pub struct SyncPath {
	from string			//path in the build dir
	to 	 string			//path in the app dir
}


[heap]
pub struct App {
pub mut:
	version  string //unique version, so we know what we have build and where to sync it
	name     string
	params 	 params.Params
	runner_id int
	node_str  string = "localhost" // root@192.168.10.10 or root@192.168.10.10:2233 or localhost
	wish			AppWish
	install_state	State
	build_state		State
	synced_state	State //is the code available locally and in line with version
	tcp_ports        []int
	unixsocket_paths []string	
	bins 	 []BinPath //how binaries need to be copied int ~/hub/bin/$name destination is just a name, bins are for all apps
	sync 	 []SyncPath //what needs to be synced from the source to the destination (after build)
	apps 	 &Apps [str: skip]
}


//we return unknown if we don't know it
pub fn (mut app App) exists() bool {
	// if !os.exists(app.appdir.path) {
	// 	return false
	// }
	// for bin in app.bins {
	// 	path := '${app.appdir}/bin/${bin.name}'
	// 	println(' - check exists: ${path}')
	// 	if !os.exists(path) {
	// 		return false
	// 	}
	// }
	// if app.bins == [] {
	// 	return false
	// }
	// for s in app.sync {
	// 	from := '${app.appdir}/${s.from}'
	// 	to := '${app.appdir}/${s.to}'
	// 	println(' - check exists: ${to}')
	// 	if !os.exists(to) {
	// 		return false
	// 	}
	// }	
	return true
}

// copy binary related to app to the sandbox (~/hub3/bin) & register in metadata
pub fn (mut app App) install(path string, name_ string) ? {
	// mut f := factory
	// mut name := name_

	// if name == '' {
	// 	name = os.base(path)
	// }

	// path_dest := '${f.bin_path}/${name}'

	// if !os.exists(f.bin_path) {
	// 	return error('cannot find bin path to register in app: ${app.name}')
	// }

	// if os.exists(path_dest) {
	// 	os.rm(path_dest)?
	// }
	// os.cp(path, path_dest)?

	// app.bin_register(name)?

	println("ECHO")
}
