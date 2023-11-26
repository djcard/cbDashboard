<cfscript>
	controller.getSetting("dashboardZones").each(function(item){
		if(item.keyExists("top") && item.top){
			writeoutput(controller.getSetting("cbDashboard#item.key#Rendered"));
		}
	});
</cfscript>

