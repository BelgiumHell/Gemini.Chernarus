//var
_name = [5] call Zen_StringGenerateRandom;
explP = false;


//Set location for triggers
_missionDropoffzone = getMarkerPos "mrk_return";


//location
_location = ["mrk_area",0,0,2,[3,500],[0,360],[0,0,0],[0,0,0],[0,0],[1,15,300]] call Zen_FindGroundPosition;

//Create marker
_marker = createMarker [_name, _location];
_name setMarkerType "mil_objective";
_name setMarkerColor "ColorOPFOR";

//Spawn cache and wreck
cache = "Box_IND_AmmoVeh_F" createVehicle _location;
publicVariable "cache";//Global to add action
_locationW = [_location,10,10] call Zen_ExtendPosition;
_wreck = "Land_Wreck_Plane_Transport_01_F" createVehicle ([_locationW, random 50, random 50] call BIS_fnc_relPos);


//Create task
_task = [west,"A C-130 was shot down overseas and dropped an experimental weapons cache. Dive down to the wreckage and return the cache to base","Return sunken cache",_location,true,"",_name] call Zen_InvokeTask;


//Spawn enemies
[_location,600,[0,false],[0,false],[0,false],[0,false],[0,false],[3,false,"cas"],[6,true]] spawn JOC_spawnZone;


[{cache addAction ["Set explosives", {[{{explP = true};},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;}];},"BIS_fnc_spawn",true,true] call BIS_fnc_MP;

waitUntil{explP};

Sleep 60;

"Bo_GBU12_LGB" createVehicle (getPos cache);

sleep 5;

[_name, "succeeded"] call Zen_UpdateTask;


//Cleanup
deleteVehicle cache;
deleteVehicle _wreck;
taskActive = 0;