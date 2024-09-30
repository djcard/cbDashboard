component {

	property name="print" inject="PrintBuffer";

	function run(){
		var sep     = server.separator.file;
		var newPath = parseRootFolder( sep );

		if ( !newPath.len() ) {
			print.line( "It wasn't possible to move the settings files from #expandPath( newPath )# folder to the /config/modules folder. Please move them manually." )
				.toConsole();
			return;
		}

		var directoryMade = directoryExists( expandPath( newpath & "#sep#config#sep#modules" ) ) ? true : directoryCreate(
			expandPath( newpath & "#sep#config#sep#modules" )
		);
		var settingsFileExists = fileExists(
			expandPath( newpath & "#sep#config#sep#modules#sep#cbDashboard.cfc" )
		) ? true : fileCopy(
			"resources#sep#cbDashboard.cfc",
			expandPath( newpath & "#sep#config#sep#modules#sep#cbDashboard.cfc" )
		);
		var settingsJSONExists = fileExists(
			expandPath( newpath & "#sep#config#sep#modules#sep#cbDashboard.json" )
		) ? true : fileCopy(
			"resources#sep#cbDashboard.json",
			expandPath( newpath & "#sep#config#sep#modules#sep#cbDashboard.json" )
		);
	}


	function parseRootFolder( sep ){
		var fold = getCwd().listToArray( sep );

		var found   = false;
		var newPath = fold;
		while ( !found ) {
			print.line( "Trying #newpath.toList( sep )#" ).toConsole();
			if ( !directoryExists( newpath.toList( sep ) & sep & "config" ) ) {
				newPath = newPath.slice( 1, newPath.len() - 1 );
			} else {
				found = true;
				return newPath.toList( sep );
			}
		}
		return "";
		// return directoryExists(newpath.toList(sep) &sep & "config") ? newpath.toList(sep) : "";
	}

}
