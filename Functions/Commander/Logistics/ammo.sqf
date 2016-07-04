/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_array"];
_order = [];

//Get nearest base
_startPos = [(_array select 0),"base",1200]call JOC_cmdMiscGetNearestStrategic;
if(count (_startPos - [0,0,0]) == 0)exitWith{_order};

//Generate composition
_vehArr = [];
_vehArr pushBack (apcPool call BIS_fnc_selectRandom);
{
    _vehArr pushBack _x;
} forEach supportPool;

//Spawn convoy
_groupConvoy = [_startPos,_vehArr]call JOC_cmdSpawnConvoy;
_groupConvoy setVariable ["JOC_caching_disabled", true];
[_groupConvoy]call JOC_setGroupID;
_wp1 = _groupConvoy addWaypoint [(_array select 0), 0];
_wp1 setWaypointType "MOVE";


_scriptArray = [
["(leader (_this select 1)) distance2D ((_this select 0) select 0) < 75","{_x setFuel 1;_x setVehicleAmmo 1;_x setDamage 0;} forEach _objects;}; _wp1 = (_this select 1) addWaypoint [((_this select 0) select 0), 0];_wp1 setWaypointType ""MOVE"";"],
["(count (waypoints (_this select 1)) == 0) && !([getPosASL (leader _x), 1100, [""plane""]]call JOC_playersNear)","{deleteVehicle (vehicle _x);if(!isNull _x)then{deleteVehicle _x;};} forEach (units (_this select 1));"]
];

_order = [[2,0],_array,(_groupConvoy getVariable ["groupID", -1]),_scriptArray];

_order
