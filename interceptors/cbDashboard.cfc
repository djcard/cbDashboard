/***
 * This provides the framework for the rest of the SiteModeller components to add their elements and to the main SiteModeller views
 **/

component accessors="true" extends="coldbox.system.Interceptor" {

	typeBreakdown = {
		"page": [],
		"tabs": []
	}

	function preLayout( event ){
		var dL   = controller.getModuleSettings( "cbDashboard" ).keyExists( "defaultLayout" ) 
			? controller.getModuleSettings( "cbDashboard" ).defaultLayout 
			: "homepage/index";
		var dLM = controller.getModuleSettings( "cbDashboard" ).keyExists( "defaultLayoutModule" ) 
			? controller.getModuleSettings( "cbDashboard" ).defaultLayoutModule 
			: "cbDashboard";
		event.setLayout( name = dL, module = dLM );

		var dV   = controller.getModuleSettings( "cbDashboard" ).keyExists( "defaultView" ) 
			? controller.getModuleSettings( "cbDashboard" ).defaultView 
			: "homepage/index";
		var dVM = controller.getModuleSettings( "cbDashboard" ).keyExists( "defaultViewModule" ) 
			? controller.getModuleSettings( "cbDashboard" ).defaultViewModule 
			: "cbDashboard";
		event.setView( view = dV, module = dVM );

		controller
			.getSetting( "dashboardZones" )
			.each( function( zone ){
				var data = "";
				controller
					.getSetting( "cbDashboard#zone.key#", [] )
					.each( function( item ){
						if(zone.type=="tabs"){
							data= isSimpleValue(data) ? [] : data;
							item["content"] = view(view=item.view,module=item.module,args = item.keyExists( "args" ) ? item.args : {} );
							if(item.keyExists("order")){
								data = data.insertAt(item.order,item);
							} else {
								data.append(item);
							}
						} else 	if ( item.keyExists( "view" ) ) {
							data = data & view(
								view   = item.view,
								module = item.module,
								args   = item.keyExists( "args" ) ? item.args : {}
							);
						}
					} );
				controller.setSetting( "cbDashboard#zone.key#Rendered", data );
			} );
	}
	/***
	 * After all modules have loaded, this cycles through all of the "pluggable" areas of the SiteModeller views, and assembles the siteModller views from the components modules
	 *
	 **/
	function afterAspectsLoad( event, data, buffer, rc, prc ){
		var zones = [];
		controller
			.getConfigSettings()
			.modules
			.keyArray()
			.filter( ( item ) => {
				return controller.getConfigSettings().modules[ item ].settings.keyExists( "cbDashboardZones" );
			} )
			.each( ( item ) => {
				zones.append( controller.getConfigSettings().modules[ item ].settings.cbDashboardZones, true );
			} );
		controller.setSetting( "dashboardZones", zones );

		zones.each( function( item ){
			createKey( item.key, item.type );
		} );
	}

	/***
	 * Takes each pluggable key and loops though all the registered modules to assemble the SiteModeller views from the components module pieces
	 *
	 * @keyName The name of the module which is being processed
	 * @format  What type of rendering that view is expecting
	 **/
	function createKey( keyName, pageType="page" ){
		var sourceData = typeBreakdown.keyExists(arguments.pageType) ? typeBreakdown[arguments.pageType] : [];
		controller
			.getConfigSettings()
			.modules
			.keyArray()
			.filter( function( item ){
				return controller.getConfigSettings().modules[ item ].settings.keyExists( keyName );
			} )
			.each( function( item ){
				sourceData.append( controller.getConfigSettings().modules[ item ].settings[ keyName ], true );
			} );
		controller.setSetting( "cbDashboard" & keyName, sourceData );
	}

}
