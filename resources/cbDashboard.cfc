component {

	function configure(){
		return deserializeJSON( fileRead( "cbDashboard.json" ) );
	}

}
