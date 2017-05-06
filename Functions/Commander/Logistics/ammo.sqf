/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_array"];
_order = [];

//Get nearest base
_startPos = [(_array select 0),"base",[1200,5000],[true,2000]]call JOC_cmdMiscGetNearestStrategic;
if(count (_startPos - [0,0,0]) == 0)exitWith{_order};

//Generate composition
_vehArr = [];
_vehArr pushBack (selectRandom apcPool);
{
    _vehArr pushBack _x;
} forEach supportPool;

//Spawn convoy
_groupConvoy = [_startPos,_vehArr]call JOC_cmdSpawnConvoy;
_groupConvoy setVariable ["JOC_caching_disabled",true,true];
_wp1 = _groupConvoy addWaypoint [(_array select 0),0];
_wp1 setWaypointType "MOVE";


_scriptArray = [
["(leader (_this select 1)) distance2D ((_this select 0) select 0) < 75","{_x setFuel 1;_x setVehicleAmmo 1;_x setDamage 0;} forEach _objects;}; _wp1 = (_this select 1) addWaypoint [((_this select 0) select 0),0];_wp1 setWaypointType ""MOVE"";"],
["(count (waypoints (_this select 1)) < 2)","(_this select 1) setVariable[""JOC_cleanUp"",true ,true]"]
];

_order = [[[2,0],_array,(_groupConvoy getVariable ["groupID",-1]),_scriptArray]];

_order
