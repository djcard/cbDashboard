
<!DOCTYPE html>
<html lang="en">
<head>
	<meta charset="UTF-8">
	<title>Title</title>
	<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-T3c6CoIi6uLrA9TneNEoa7RxnatzjcDSCmG1MXxSR1GAsXEV/Dwwykc2MPK8M2HN" crossorigin="anonymous">
	<!---
		This is a test feature which is designed to help different tabs share data without making calls to the server
		via a centralized JS store. It is not documented as of yet. 
		<script type="text/javascript">
		function cbDashboardStore() {
			this.listeners = {};
			this.listenerDefinitions = {};
			this.root = {
				"envVars": {}
			};
			this.listeners = {};
			this.get=function(property){
				return this.root.hasOwnProperty(property) ? this.root[property] : ""
			};

			this.set = function(property, value, eventName){
				this.root[property]=value;
				if(eventName) {
					this.announce(eventName)
				}
			};

			this.addEnvVar =function(propertyName,value){
				this.root.envVars[propertyName]=value;
				this.announce("envVarChanged")
			}

			this.addQS =function(propertyName,value){
				this.root.qs[propertyName]=value;
				this.announce("qsChanged")
			}

			this.addListener = function (name,callback){
				if(this.listeners.hasOwnProperty(name)){
					this.listeners[name].push(callback)
				} else {
					this.listeners[name]=[callback];
				}
			}

			this.registerEvent = function(name,rootKey){
				this.listenerDefinitions[name] = rootKey;
			}

			this.announce = function(name){
				if(!this.listeners[name]?.length){
					//console.dir("There are no listeners for " + name);
				}
				//console.dir("announcing " + name + " to " + this.listeners[name]?.length );
				this.listeners[name]?.forEach((item)=>{
					//console.dir("sending the " + this.listenerDefinitions[name] + " value");
					//console.dir(this.root[this.listenerDefinitions[name]]);
					item(this.root[this.listenerDefinitions[name]])
				})
			}

			this.exists = function(){
				return true;
			}
		}
		window.cbDashboardSTORE = new cbDashboardStore();
	</script>--->
</head>
<body>
	<h1>Welcome. You have successfully installed CBDashboard</h1>
	<p>This main layout is designed to get you started. There should be two tabs below. <br/>
		The first is displaying views/demoTab.cfm an the second is displaying demoTab2.cfm</p>
		<p>In the config/modules/cbDashboard.json file, try changing the "types" key in the cbDashboardZones from "tabs" to "page" and re-initing the application. </p>
	<cfoutput>#view()#</cfoutput>
	<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-C6RzsynM9kWDrMNeT87bh95OGNyZPhcTNXj1NW7RuBCsyN/o0jlpcV8Qyq46cDfL" crossorigin="anonymous"></script>
</body>
</html>
