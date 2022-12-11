module runner


import freeflowuniverse.crystallib.actionparser
import freeflowuniverse.crystallib.pathlib
import freeflowuniverse.crystallib.texttools
import freeflowuniverse.crystallib.params
import freeflowuniverse.baobab.appsbox
import freeflowuniverse.baobab.services.postgresql
import freeflowuniverse.baobab.services.installcache
import regex

pub fn run (path0 string)!{

	mut path := pathlib.get_dir(path0, false)!	
	mut apps:=appsbox.new()!

	mut re := regex.regex_opt(".*") or {panic(err)}
	ar:=path.list(mut regex:re, 	recursive:true)!
	for p in ar{
		if p.path.ends_with(".md"){
			run_one(mut apps, p.path)!
		}
	}
}


fn run_one(mut apps appsbox.Apps, path string)!{

	mut parser := actionparser.file_parse(path)!

	for mut action in parser.actions {
		$if debug {
			print(texttools.indent('$action\n ', '  |  '))
		}

		mut instance:=""
		name = action.name.split(".")[1]
		if action.name.starts_with("app") || action.name.starts_with("service"){
			instance = action.params.get_default("instance","default")!

			version := action.params.get_default("version","0.0.0")!
			action.params.kwarg_add("name",name)
			if ! action.params.exists("version"){
				action.params.kwarg_add("version",version)			
			}
			if ! action.params.exists("instance"){
				action.params.kwarg_add("instance",instance)			
			}			
		}
		mut app:=apps.new(name,instance,action.params)!

		if action.name.starts_with("service"){
			if name=="installcache"{
				installcache.define(mut app)!
			}
		}

		if action.name.starts_with("app"){	
			action.name.starts_with("app.postgresql.build"){
				postgresql.build(mut app)!
			}
			action.name.starts_with("app.postgresql.install"){
				postgresql.install(mut app)!
			}
		}



	}

}

	