/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_array","_force"];

//Get nearest base
_startPos = [(_array select 0),"base",[1200,5000]]call JOC_cmdMiscGetNearestStrategic;
if(count (_startPos - [0,0,0]) == 0 || count (_startpos nearEntities ["car", 200]) > 0)exitWith{[]};

//Generate composition
_vehArr = [];
_truckCount = _force * 2 - random 2;
_apcCount = _force + random 1;
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
_convoyReturn = [_startPos,_vehArr]call JOC_cmdSpawnConvoy;
_groupConvoy = _convoyReturn select 0;
_groupsInf = _convoyReturn select 1;
_groupConvoy setVariable["JOC_caching_disabled", true, true];

{
    _x setVariable["JOC_caching_disabled",true, true];
    assignedArray pushBack [_x getVariable ["groupID", -1],_array select 5];
}forEach _groupsInf;

//Move to target
_movePos = selectRandom ((_array select 0) nearRoads 300);
_wp1 = _groupConvoy addWaypoint [_movePos, 0];
_wp1 setWaypointType "TR UNLOAD";
_wp1 setWaypointCompletionRadius 50;

_scriptArray = [
["(leader (_this select 1)) distance2D ((_this select 0) select 0) < 200","(_this select 1) setVariable[""JOC_caching_disabled"", false, true];(_this select 1) setVariable[""JOC_cleanUp"", true, true];"]
];

_order = [[[1,2],_array,(_groupConvoy getVariable ["groupID", -1]),_scriptArray]];

{
    _scriptArray = [
    ["(leader (_this select 1)) distance2D ((_this select 0) select 0) < 200","(_this select 1) setVariable[""JOC_caching_disabled"", false, true];(_this select 1) setVariable[""JOC_cleanUp"", true, true];"]
    ];
    _order pushBack [[1,2],_array,(_x getVariable ["groupID", -1]),_scriptArray];
} forEach _groupsInf;

_order
