/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_veh"];

if(!isServer)exitWith{};
waitUntil{!isNil{JOC_serverLoaded}};
waitUntil{JOC_serverLoaded};

_type = typeOf _veh;
_pos = getPosASL _veh;
_dir = getDir _veh;

deleteVehicle _veh;

vehArray pushBack [_type, _pos, _dir, objNull];
