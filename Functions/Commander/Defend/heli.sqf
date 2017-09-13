params["_array", "_force"];

//Find airfield
_airfield = [_array select 0, "airfield", [1000, 99999], [0]] call JOC_cmdMiscGetNearestStrategic;
if ((count _airfield) == 0)exitWith{[]};
_airfieldPos = _airfield select 0;

JOC_pauseCache = true;

//Generate composition
_heliArr = [];
_gunshipArr = [];
_heliCount = _force * 2 - random 2;
_gunshipCount = _force + random 1;
_i = 0;
while{_i < _heliCount}do{
    _heliArr pushBack (selectRandom heliPool);
    _i = _i + 1;
};
_i = 0;
while{_i < _gunshipCount}do{
    _gunshipArr pushBack (selectRandom poolCas);
    _i = _i + 1;
};

_order = [];
_list = nearestObjects [_airfieldPos, ["LocationRespawnPoint_F"], 2000];
_posHeli = getPos (_list select 0);

{
    _posHeli = [_posHeli, 100, 0] call BIS_fnc_relPos;
    _veh = createVehicle [_x, _posHeli, [], 0, "FLY"];
    createVehicleCrew _veh;
    [(group ((crew _veh) select 0))] call JOC_coreSetID;
    (group ((crew _veh) select 0)) setVariable ["JOC_caching_disabled", true, true];

    _wp1 = (group ((crew _veh) select 0)) addWaypoint [(_array select 0), (_array select 1) * 1.5];
    _wp1 setWaypointType "TR UNLOAD";
    _wp1 setWaypointCompletionRadius 500;

    _group = [[0, 0, 0], east, "infantry", getNumber(configFile >> "CfgVehicles" >> _x >> "transportSoldier"), "Basic"] call Zen_SpawnInfantry;
    [_group] call JOC_coreSetID;
    _group setVariable ["JOC_caching_disabled", true, true];
    assignedArray pushBack [[_group] call JOC_coreSetId, _array select 5];
    {
        _x moveInAny _veh;
    } forEach (units _group);

    _wp2 = _group addWaypoint [(_array select 0), (_array select 1)];
    _wp2 setWaypointType "MOVE";

    _scriptArray1 = [
    ["crew (vehicle (leader (_this select 1))) < 4", "_airfieldPos = ([getPos ((_this select 1) select 0), ""airfield"", [1000, 99999]] call JOC_cmdMiscGetNearestStrategic) select 0; _wp1 = (_this select 1) addWaypoint [_airfieldPos, 0];_wp1 setWaypointType ""GETOUT"";"], 
    ["(count (waypoints (_this select 1)) <= currentWaypoint (_this select 1))", "(_this select 1) setVariable [""JOC_caching_disabled"", false, true];(_this select 1) setVariable [""JOC_cleanUp"", true, true]"]
    ];
    _scriptArray2 = [
    ["isNull (objectParent (leader (_this select 1)))", "(_this select 1) setVariable [""JOC_caching_disabled"", false, true];(_this select 1) setVariable [""JOC_cleanUp"", true, true];"]
    ];
    _order pushBack [[1, 1], _array, [(group ((crew _veh) select 0))] call JOC_coreGetId, _scriptArray1];
    _order pushBack [[1, 1], _array, [_group] call JOC_coreSetId, _scriptArray2];
} forEach _heliArr;

{
    _veh = createVehicle [_x, _posHeli, [], 0, "FLY"];
    createVehicleCrew _veh;
    [(group ((crew _veh) select 0))] call JOC_coreSetID;
    (group ((crew _veh) select 0)) setVariable ["JOC_caching_disabled", true];

    _wp1 = (group ((crew _veh) select 0)) addWaypoint [(_array select 0), 0];
    _wp1 setWaypointType "SAD";

    _scriptArray = [
    ["fuel (vehicle (leader (_this select 1))) < 0.1 || damage (vehicle (leader (_this select 1))) > 0.5 || (_this select 0) select 4 == 1", "_airfieldPos = ([getPos ((_this select 1) select 0), ""airfield"", [1000, 99999]] call JOC_cmdMiscGetNearestStrategic) select 0; _wp1 = (_this select 1) addWaypoint [_airfieldPos, 0];_wp1 setWaypointType ""GETOUT"";"], 
    ["(count (waypoints (_this select 1)) <= currentWaypoint (_this select 1))", "(_this select 1) setVariable [""JOC_cleanUp"", true, true]"]
    ];
    _order pushBack [[1, 1], _array, [(group ((crew _veh) select 0))] call JOC_coreGetId, _scriptArray];
} forEach _gunshipArr;

_order
