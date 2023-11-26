
component {
    property name="coldbox"  inject="coldbox";
    property name="tabsTool" inject="tabs@uime";

    function tabs(keyName){
        var content = coldbox.getSetting("cbDashboard" & keyName & "rendered",[]);
        return tabsTool.run(content);
    }
}