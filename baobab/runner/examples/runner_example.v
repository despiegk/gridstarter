module main

// import os
import freeflowuniverse.baobab.runner
import os

const testpath = os.dir(@FILE) + '/instructions'

fn do() ! {
	//will look for
	// export RUNNERDOC=https://gist.github.com/despiegk/linknotspecified
	// if the env argument found will get the code and execute
	runner.run(testpath)!
}

fn main() {
	do() or { panic(err) }
}
