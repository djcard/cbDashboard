component {

	function demoHandler( event, rc, prc ){
		controller.setSetting( "my_demo_variable", "Hello, the date is #dateFormat( now(), "yyyy-mm-dd" )#" );
	}

}
