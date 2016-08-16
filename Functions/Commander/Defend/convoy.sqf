/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_array","_category"];

//Get nearest base
_startPos = [(_array select 0),"base",[1200,5000]]call JOC_cmdMiscGetNearestStrategic;
if(count (_startPos - [0,0,0]) == 0)exitWith{false};

//Generate composition
_vehArr = [];
_truckCount = _category * 2 - random 2;
_apcCount = _category + random 1;
_i = 0;
while{_i < _apcCount}do{
    _vehArr pushBack (selectRandom apcPool);
    _i = _i + 1;
};
_i = 0;
while{_i < _truckCount}do{
    _vehArr pushBack (selectRandom truckPool);
    _i = _i + 1;
};

//Spawn convoy
_groupConvoy = [_startPos,_vehArr]call JOC_cmdSpawnConvoy;
_groupConvoy setVariable["JOC_caching_disabled",true];

//Move to target
_wp1 = _groupConvoy addWaypoint [(_array select 0), 0];
_wp1 setWaypointType "UNLOAD";
_wp1 setWaypointCompletionRadius 400;

_scriptArray = [
["(leader (_this select 1)) distance2D ((_this select 0) select 0) < 450","_wp1 = (_this select 1) addWaypoint [((_this select 0) select 0), 0];_wp1 setWaypointType ""SAD""; (_this select 1) setVariable[""JOC_caching_disabled"",false];"]
];

_order = [[[1,2],_array,(_groupConvoy getVariable ["groupID", -1]),_scriptArray]];

_order