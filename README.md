# cbDashboard
A Dynamic Dashboard Utility for the Coldbox Framework

# Background
Dashboard is a UI that can dynamically create a layout composed of Coldbox views from assorted modules. The layouts
can be created via configuration files from a main module and can be laid out in tabs, tiled, as a large page or other configurations. 

## Types of Zones

Page - The rendered views are stored in an array and then appear on the page in sequence.

Tabs - The rendered views and other data are stored in an array of structs with each item being a tab in that section.

Flex - The rendered views are stored in an array which are then rendered inside a flexbox. An example could be a panel dashboard.

## Declaring Zones

Zones can be set either in the ModuleConfig for a module or in the config/Coldbox.cfc using this format:
`cbDashboardZones:[
    {"key": "myZone","type": "tabs", "top":true}
]`

Key - This is the name of the zone being set

type - This indicates the type of rendering which will be done. 

top - indicates that this is top level and the display will be handled by the primary layout or view. If true, this will be a aprt of the main 

layout.  If false, that zone will be skipped on the initial render. This allows modules to have their own dynamic areas and not have data meant for those "sub areas" also be rendered at the top level.

Any module can register a zone as the names of the zones are processed first before any views are rendered

## Defining a default view

By default, cbDashboard uses its default view. However, this is a very simple page which will render each view one after another. It is more likely that you will want to create your own default view. CBDashboard's layout has the CSS and JS for Bootstrap referenced. 

			"cbDashboard": {
				"defaultView": "home/index",
				"defaultViewModule": "myModuleName"
			}


An example view might look like this:

`<div class="container-fluid">
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
            #getInstance("cbDashboard@cbDashboard").tabs("myZone")#
        </cfoutput>
    </div>
</div>`


## Assigning a view to a zone

Again, any module can assign these properties in their ModuleConfig (and can subsequently be overridden in config/Coldbox.cfc ). In the settings key in the ModuleConfig, set a property which corresponds to the name of a zone. Obviously this requires knowing what the zones are.

`"myZone":[
    {"label":"Ecosystem Summary","view":"branchReport","module":"ecoSystemSummary"}
]`

Higher up on this page, we established "myZone" as a "tab" zone. By using "myZone" as the setting key for this module, you can list views which should appear as tabs in that zone. The "label" will appear in the tab itself and, when clicked, will show the rendered content for referenced view and module.