module appsbox

import freeflowuniverse.crystallib.pathlib
import os

[heap]
pub struct AppPaths {
pub mut:
	etc  pathlib.Path
	bin  pathlib.Path
	var  pathlib.Path
	build  pathlib.Path
	apps  pathlib.Path
	base  pathlib.Path
}

//change the base dir of the apps installation
pub fn (mut apps Apps) set_paths(path1 string) !{
	mut path := path1.replace("~",os.home_dir())
	mut base:=pathlib.get_dir(path,true)!
	mut etc:=pathlib.get_dir("$path/etc",true)!
	mut bin:=pathlib.get_dir("$path/bin",true)!
	mut appspath:=pathlib.get_dir("$path/apps",true)!
	mut var:=pathlib.get_dir("$path/var",true)!
	mut build:=pathlib.get_dir("$path/build",true)!
	mut ap := AppPaths{
		etc:etc , 
		bin:bin ,
		apps:appspath ,
		base:base ,
		var:var ,
		build:build ,
		}
	apps.paths = ap
}

