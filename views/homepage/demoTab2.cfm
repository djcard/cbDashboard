<div>This is the demo tab 2. It runs an event before rendering this view which sets the date below.</div>
<cfoutput>
    <div>
        #controller.getSetting("my_demo_variable","Hmm, I didn't find the variable called 'my_demo_variable'. Did you run the event?")#
    </div>
</cfoutput>