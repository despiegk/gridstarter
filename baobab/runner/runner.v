module runner


import freeflowuniverse.crystallib.actionparser
import freeflowuniverse.crystallib.pathlib
import freeflowuniverse.crystallib.texttools
import freeflowuniverse.crystallib.params
import freeflowuniverse.baobab.appsbox
import freeflowuniverse.baobab.installers.postgres
import regex

pub fn run (path0 string)!{

	mut path := pathlib.get_dir(path0, false)!	
	mut apps:=appsbox.new()

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

		if action.name.starts_with("app"){
			name := action.params.get("name")! //will give error if not found
			mut app:=apps.new(name,action.params)!
			action.name.starts_with("app.postgresql"){
				postgres.run(mut apps, mut app)!
			}
			

		}

	}

}

	