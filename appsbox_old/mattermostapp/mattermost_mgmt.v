module mattermostapp

import os
import freeflowuniverse.crystallib.builder
import freeflowuniverse.crystallib.appsbox

[heap]
pub struct MattermostApp {
pub mut:
	name      string
	appconfig appsbox.AppConfig
}

pub struct MattermostAppArgs {
	name            string = 'default'
	port            int    = 5432
	unixsocketpath  string = ''
	postgres_passwd string = 'oursecret' // should be changed by user when init
}

pub fn get(args MattermostAppArgs) appsbox.App {
	mut factory := appsbox.get()

	for item in factory.apps {
		if item.appconfig.tcpports == [args.port] && item.appconfig.name == args.name {
			return item
		}
	}

	println('[-] appconfig not found, creating a new one')

	mut i := appsbox.AppConfig{
		name: args.name
		tcpports: [args.port]
	}

	mut myapp := MattermostApp{
		name: args.name
		appconfig: i
	}

	factory.apps << myapp
	return myapp
}

pub fn (mut myapp MattermostApp) start() ? {
	mut factory := appsbox.get()

	myapp.install(false)?

	mut n := builder.node_local()?

	// start mattermost

	/*
	mut tcpport := myapp.appconfig.tcpports[0]
	bin_path := factory.bin_path

	//set a start command for postgresql
	cmd := "${bin_path}/postgres_start"
	n.exec(cmd:cmd, reset:true, description:"start postgres",stdout:true)?
	alive := myapp.check()?
	if ! alive{
		return error("Could not start postgres.")
	}
	*/
}

pub fn (mut myapp MattermostApp) stop() ? {
	println('stop')
}

pub fn (mut myapp MattermostApp) install(reset bool) ? {
	mut factory := appsbox.get()

	mut n := builder.node_local()?

	myapp.appconfig.bins = ['../var/mattermost/bin/mattermost']

	// check app is installed, if yes don't need to do anything
	if reset || !myapp.appconfig.exists() {
		myapp.build()?
	}
}

pub fn (mut myapp MattermostApp) build() ? {
	mut factory := appsbox.get()

	mut n := builder.node_local()?

	tmpdir := '/tmp/mattermost/'
	binpath := factory.bin_path
	varpath := factory.var_path
	gover := '1.16.7'

	mut cmd := $tmpl('mattermost_build.sh')
	n.exec(
		cmd: cmd
		reset: true
		description: 'install mattermost; echo ok'
		stdout: true
		tmpdir: tmpdir
	)?
}

pub fn (mut myapp MattermostApp) check() ?bool {
	println('check')
	return false
}

pub fn (mut myapp MattermostApp) client() ? {
	println('client')
}
