/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_array", "_force"];

//Get nearest base
_startBase = [(_array select 0), "base", [1200, 5000]] call JOC_cmdMiscGetNearestStrategic;
if ((count _startBase) == 0) exitWith {[]};
_startPos = _startBase select 0;

//Make base unavailable for some time
_startBase set [5, 1];
[{_this set [5, 0];}, _startBase, (3600 / strengthEast)] call CBA_fnc_waitAndExecute;

//Generate composition
_vehArr = [];
_truckCount = (_force * 2 - (random _force)) - 1;
_apcCount = (_force * 0.75 + (random (_force * 0.5))) - 1;

for "_i" from 0 to _apcCount step 1 do {
    _vehArr pushBack (selectRandom poolApc);
};
for "_i" from 0 to _truckCount step 1 do {
    _vehArr pushBack (selectRandom poolTruck);
};

//Spawn convoy
_convoyReturn = [_startPos, _vehArr, _startPos getDir (_array select 0), false] call JOC_spawnConvoy;
_groupConvoy = _convoyReturn select 0;
_groupsInf = _convoyReturn select 1;

//Move to target
_movePos = selectRandom (([_array select 0, 400, (_array select 0) getDir _startPos] call BIS_fnc_relPos) nearRoads 300);
_wp1 = _groupConvoy addWaypoint [_array select 0, 0];
_wp1 setWaypointType "MOVE";
_wp1 setWaypointCompletionRadius 400;

_scriptArray = [
["speed (vehicle (leader (_this select 1))) > 1", ""], 
["speed (vehicle (leader (_this select 1))) < 1 && count ((units (_this select 1)) select {count ((crew (vehicle _x)) select {group _x != (_this select 1)}) == 0}) == 0", "_wp1 = (_this select 1) addWaypoint [((_this select 0) select 0), 0];_wp1 setWaypointType ""SAD"";"], 
["(leader (_this select 1)) distance2D ((_this select 0) select 0) < 200", "(_this select 1) setVariable [""JOC_caching_disabled"", false, true];(_this select 1) setVariable [""JOC_cleanUp"", true, true];"]
];

_groupConvoy setVariable ["JOC_caching_disabled", true, true];
_order = [[[1, 2], _array, [_groupConvoy] call JOC_coreGetId, _scriptArray]];

{
    _scriptArray = [
    ["speed (vehicle (leader (_this select 1))) > 1", ""], 
    ["(vehicle (leader (_this select 1))) distance2D ((_this select 0) select 0) < 200", ""], 
    ["speed (vehicle (leader (_this select 1))) < 1", "[[(_this select 1)], {(_this select 0) leaveVehicle (vehicle (leader (_this select 0)));}] remoteExec [""BIS_fnc_spawn"", groupOwner (_this select 1), false]; _wp1 = (_this select 1) addWaypoint [((_this select 0) select 0), 0];_wp1 setWaypointType ""MOVE"";"], 
    ["(leader (_this select 1)) distance2D ((_this select 0) select 0) < 200", "(_this select 1) setVariable [""JOC_caching_disabled"", false, true];(_this select 1) setVariable [""JOC_cleanUp"", true, true];"]
    ];
    _order pushBack [[1, 2], _array, [_x] call JOC_coreGetId, _scriptArray];
} forEach _groupsInf;

_order
