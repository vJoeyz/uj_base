local a={}local b,c;local function d()if b.motd.enabled then guihooks.trigger('ScenarioChange',{name=b.motd.title,description=b.motd.description,introType=b.motd.type})end end;local function e()b=require("settings/config")if b.motd.enabled then guihooks.trigger("ChangeState",{state="scenario-start"})end;if b.restrictMenu then extensions.core_gamestate.setGameState("scenario","freeroam","uj_base")end end;local function f()extensions.core_gamestate.setGameState("freeroam","freeroam","freeroam")end;local function g(h,i)local j=be:getPlayerVehicle(0)if j then core_vehicles.replaceVehicle(h,i)else core_vehicles.spawnNewVehicle(h,i)end end;local function k(l)if l=="start"then d()elseif l=="play"then if not c then g("pickup",{})end end end;local function m(n)if b.motd.type=="selectableVehicle"then if n.model and n.config then local o=createPlayerSpawningData(n.model,n.config,n.color,n.licenseText)g(o.model,o.options)c=true end end end;a.onExtensionLoaded=e;a.onExtensionUnloaded=f;a.onVehicleSelected=m;a.onScenarioUIReady=k;return a
