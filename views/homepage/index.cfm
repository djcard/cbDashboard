<div class="container-fluid">
    <div class="row">
        <div class="col">
            Welcome to My Dashboard
        </div>
        <div class="col">
            Name etc
        </div>
    </div>
    <div class="row">
        <cfoutput>
            <cfscript>
                controller.getSetting("dashboardZones",[]).each(function(item){
                    if(item.keyExists("top") && item.top){
                        writeOutput(getInstance("cbDashboard@cbDashboard")[item.type](item.key));
                    }
                });
            </cfscript>
        </cfoutput>
    </div>
</div>

