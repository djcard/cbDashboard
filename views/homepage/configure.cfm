<cfset settings = deserializeJSON(fileRead(expandpath("/config/modules/cbDashboard.json"))) />
<cfoutput>
    <form action="#cgi.SCRIPT_NAME#" method="POST">
        Default View: <input type="text" name="defaultViewModule" value="#settings.defaultViewModule#" /><br/> 
        <input type="text" name="defaultView" value="#settings.defaultView#" /><br/>
        <input type="submit" />
    </form>
</cfoutput>
<cfdump var="#form#" />
<cfdump var="#settings#" />
<cfif form.keyExists("defaultView")>
    <cfset settings.defaultView=form.defaultView>
    <cfset settings.defaultViewModule=form.defaultViewModule>
</cfif>