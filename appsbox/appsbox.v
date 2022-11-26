module appsbox

import freeflowuniverse.crystallib.actionrunner
import os


fn run (path string)!{
	mut ar := actionrunner.run(path)!
	println(ar)

}

// // set home directory and do initialization of multiple parts
// fn (mut apps AppsBox) home_set(path_ string) {
// 	mut path := path_
// 	if path == '' {
// 		// path="~/hub3"
// 		path = rootpath.rootdir()
// 	}
// 	if apps.apps_path == '' {
// 		apps.apps_path = path
// 	}
// 	if apps.bin_path == '' {
// 		apps.bin_path = '$apps.apps_path/bin'
// 	}
// 	if apps.var_path == '' {
// 		apps.var_path = '$apps.apps_path/var'
// 	}
// 	apps.apps_path = apps.apps_path.replace('~', os.home_dir())
// 	if !os.exists(apps.apps_path) {
// 		os.mkdir_all(apps.apps_path) or { panic('cannot create apps_path') }
// 	}
// 	apps.bin_path = apps.bin_path.replace('~', os.home_dir())
// 	if !os.exists(apps.bin_path) {
// 		os.mkdir_all(apps.bin_path) or { panic('cannot create bin_path') }
// 	}
// 	apps.var_path = apps.var_path.replace('~', os.home_dir())
// 	if !os.exists(apps.var_path) {
// 		os.mkdir_all(apps.var_path) or { panic('cannot create var_path') }
// 	}
// }
