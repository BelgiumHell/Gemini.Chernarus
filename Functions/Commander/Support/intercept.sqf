/////////////////////////
//Script made by Jochem//
/////////////////////////
//Find airfield
_airfield = [_array select 0,"airfield",[1000,99999]]call JOC_cmdMiscGetNearestStrategic;
if((count _airfield) == 0)exitWith{[]};
_airfieldPos = _airfield select 0;

//Spawn jet
JOC_pauseCache = true;

_list = nearestObjects [_airfieldPos,["LocationRespawnPoint_F"],1000];
_pos = getPos (_list select 0);
_jet = (selectRandom jetPoolAA) createVehicle _pos;
_jet setDir (getDir (_list select 0));
createVehicleCrew _jet;
_group = (group ((crew _jet) select 0));
[_group]call JOC_setGroupID;
(_group) setVariable["JOC_caching_disabled",true];

JOC_pauseCache = false;

_wp = _group addWaypoint [[0,0],0];
_wp setWaypointType "DESTROY";
_wp waypointAttachObject ((jetTargets + heliTargets) select 0);
_wp setWaypointStatements ["count (jetTargets + heliTargets) != 0","if(!isServer)exitWith{}; _wp = (group this) addWaypoint [[0,0],0]; _wp setWaypointType ""DESTROY""; _wp waypointAttachObject ((jetTargets + heliTargets) select 0); _wp setWaypointStatements [""count (jetTargets + heliTargets) != 0"",""if(!isServer)exitWith{}; _wp = (group this) addWaypoint [[0,0],0]; _wp setWaypointType ""DESTROY""; _wp waypointAttachObject ((jetTargets + heliTargets) select 0);""];"];

_scriptArray = [
["fuel (vehicle (leader (_this select 1))) < 0.1 || damage (vehicle (leader (_this select 1))) > 0.5 || count (jetTargets + heliTargets) == 0","_airfieldPos = ([getPos ((_this select 1) select 0),""airfield"",[1000,99999]]call JOC_cmdMiscGetNearestStrategic) select 0; _wp1 = (_this select 1) addWaypoint [_airfieldPos,0];_wp1 setWaypointType ""GETOUT"";"],
["(count (waypoints (_this select 1)) < 2)","(_this select 1) setVariable[""JOC_caching_disabled"",false,true];(_this select 1) setVariable[""JOC_cleanUp"",true,true]"]
];

_order = [[[3,1],0,((group _jet) getVariable ["groupID",-1]),_scriptArray]];

_order
