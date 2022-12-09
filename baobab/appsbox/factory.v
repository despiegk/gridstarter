module appsbox

import freeflowuniverse.crystallib.texttools
import freeflowuniverse.crystallib.params
import freeflowuniverse.crystallib.builder

import os

[heap]
pub struct Apps {
pub mut:
	myapps map[string]&App
	builder builder.BuilderFactory
}

pub fn new() Apps{
	mut builder1 := builder.new()
	return Apps{builder:builder1}
}

pub fn (mut apps Apps) new(name0 string, params params.Params) !&App{
	mut name:=texttools.name_fix(name0)

	mut app := App{
		name:name
		params:params
	}

	apps.myapps[name] = &app
	
	return apps.myapps[name]
	
}



pub fn (mut apps Apps) get(name0 string) !&App{
	mut name:=texttools.name_fix(name0)

	if name in apps.myapps{
		return apps.myapps[name]
	}
	return error("cannot find app: $name0")
	
}


// pub fn (mut apps Apps) run(name0 string) !&App{

// }



pub fn (mut apps Apps) node_get(name0 string) !&builder.Node {

	mut app	:= apps.get(name0)!

	// node_args := builder.NodeArguments{
	// 	ipaddr: 'localhost'
	// 	name: app.name
	// }

	mut node := apps.builder.node_local() or { return error('Failed to create node: $err') }

	return node

}

