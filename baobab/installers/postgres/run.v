module postgres

import freeflowuniverse.baobab.appsbox

pub fn run(mut apps appsbox.Apps, mut app appsbox.App)! {

	if app.wish == .build && app.build_state == .init {
		build(mut apps, mut app)!
	}

}
