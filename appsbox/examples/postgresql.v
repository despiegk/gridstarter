module main

// import os
import freeflowuniverse.gridstarter.appsbox
import os

const testpath = os.dir(@FILE) + '/postgresql'

fn do() ! {
	//will look for
	// export RUNNERDOC=https://gist.github.com/despiegk/linknotspecified
	// if the env argument found will get the code and execute
	appsbox.run(testpath)!
}

fn main() {
	do() or { panic(err) }
}
