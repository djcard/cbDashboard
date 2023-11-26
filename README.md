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
top - indicates that this is top level and the display will be handled by the primary layout or view. If true, this will be a aprt of the main layout.  If false, that zone will be skipped on the initial render. This allows modules to have their own dynamic areas and not have data meant for those "sub areas" also be rendered at the top level.

## Assigning a view to a zone
