/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_array", "_category"];

_startBase = [(_array select 0), "base", [1200, 5000]] call JOC_cmdMiscGetNearestStrategic;
if ((count _startPos) == 0)exitWith{[]};
_startPos = _startBase select 0;

_vehArr = [];
switch (_category) do {
    case (1): {
        _vehArr = [(selectRandom poolTank), (selectRandom poolTank), (selectRandom poolApc), (selectRandom poolIfv)];
    };
    case (2): {
        _vehArr = [(selectRandom poolTank), (selectRandom poolApc)];
    };
};

//Spawn convoy
_groupConvoy = [_startPos, _vehArr] call JOC_cmdSpawnConvoy;
_groupConvoy setVariable ["JOC_caching_disabled", true];
_wp1 = _groupConvoy addWaypoint [(_array select 0), 0];
_wp1 setWaypointType "MOVE";

_scriptArray = [
["(leader (_this select 1)) distance2D ((_this select 0) select 0) < 200", "(_this select 1) setVariable [""JOC_caching_disabled"", false, true];"]
];

_order = [[[1, 0], _array, [_groupConvoy] call JOC_coreGetId, _scriptArray]];

_order
