/////////////////////////
//Script made by Jochem//
/////////////////////////
//virtualizing
if (JOC_pauseCache) exitWith {};
//[unitID, groupID, position, vehicle, class/object, virtualizing, damage, skill, side, behaviour, garrisoned]
//[vehicleID, position, class/object, virtualizing, damage]
//Give groups Id
{
    if (count units _x == 0) then {
        deleteGroup _x;
    } else {
        if ([_x] call JOC_coreGetId == -1) then {
            _x setVariable ["id", currentGroupID, true];
            currentGroupID = currentGroupID + 1;
        };
    };
} forEach allGroups;

//Add vehicles to vehicleArray
{
    _vehicle = _x;
    if ([_vehicle] call JOC_coreGetId == -1 && count (vehArray select {_x select 3 == _vehicle}) == 0 && side _vehicle != west) then {
        [vehicleArray, [currentVehicleId, getPosAsl _vehicle, _vehicle, true, damage _vehicle]] remoteExecCall ["pushBack", 0]; 
        _vehicle setVariable ["id", currentVehicleId, true];
        currentVehicleId = currentVehicleId + 1;
    };
} forEach (vehicles - allUnits);

//Add units to unitArray
{
    _unit = _x;
    if ([_unit] call JOC_coreGetId == -1 && side _unit != west) then {
        _vehicle = [-1, []];
        if (!isNull (objectParent _unit)) then {
            _vehicle = [[vehicle _unit] call JOC_coreGetId, [_unit] call JOC_getVehicleIndex];
        };
        [unitArray, [currentUnitId, [group _unit] call JOC_coreGetId, getPosAsl _unit, _vehicle, _unit, !((group _unit) getVariable ["JOC_caching_disabled", false]), damage _unit, skill _unit, side _unit, behaviour _unit]] remoteExecCall ["pushBack", 0]; 
        _unit setVariable ["id", currentUnitId, true];
        currentUnitId = currentUnitId + 1;
    };
} forEach (allUnits - playableUnits);

//vehicleArray
{
    if (typeName (_x select 2) == "STRING") then {
        if ((west countSide ((_x select 1) nearEntities[["Man", "Car", "Tank", "Helicopter"], 1100])) != 0 || !(_x select 3)) then {
            _veh = createVehicle [_x select 2, _x select 1, [], 0, "CAN_COLLIDE"];
            _veh setVariable ["id", (_x select 0), true];
            _veh setPosAsl (_x select 1);
            _veh setDamage (_x select 4);
            _x set [2, _veh];
            [[_forEachIndex, _x], {vehicleArray set [_this select 0, _this select 1]}] remoteExecCall ["BIS_fnc_call", 0];
        };
    } else {
        _id = _x select 0;
        _vehicle = _x select 2;
        if (alive _vehicle) then {
            _x set [1, getPosAsl _vehicle];
            _x set [4, damage _vehicle];
            if ((west countSide ((_x select 2) nearEntities[["Man", "Car", "Tank", "Helicopter"], 1300])) == 0 && (_x select 3)) then {
                _x set [2, typeOf _vehicle];
                deleteVehicle _vehicle;
            };
            [[_forEachIndex, _x], {vehicleArray set [_this select 0, _this select 1]}] remoteExecCall ["BIS_fnc_call", 0];
        };
    };
} forEach vehicleArray;

_realVehicles = [];
{
    if ((side _x) != west) then {
        _id = [_x] call JOC_coreGetId;
        _realVehicles pushBackUnique _id;
    };
} forEach vehicles;
_realVehicles = _realVehicles - [-1];

//unitArray
_createArray = [];
{
    if (typeName (_x select 4) == "STRING") then {
        if (((west countSide ((_x select 2) nearEntities[["Man", "Car", "Tank"], 1000])) != 0 && (((_x select 3) select 0) == -1)) || !(_x select 5) || ((_x select 3) select 0) in _realVehicles) then {
            _createArray pushBack [_forEachIndex, _x];
        };
    } else {
        _unit = _x select 4;
        if (alive _unit) then {
            _x set [1, [group _unit] call JOC_coreGetId];
            _x set [2, getPosAsl _unit];
            if (!isNull objectParent _unit) then {
                _x set [3, [[vehicle _unit] call JOC_coreGetId, [_unit] call JOC_getVehicleIndex]];
            };
            _x set [6, damage _unit];
            _x set [7, skill _unit];
            _x set [8, side _unit];
            _x set [9, behaviour _unit];
            _x set [10, (_unit getVariable ["garrisoned", false])];
            if ((west countSide ((_x select 2) nearEntities[["Man", "Car", "Tank"], 1200])) == 0 && (_x select 5) && !(((_x select 3) select 0) in _realVehicles)) then {
                _x set [4, typeOf _unit];
                deleteVehicle _unit;
            };
            [[_forEachIndex, _x], {unitArray set [_this select 0, _this select 1]}] remoteExecCall ["BIS_fnc_call", 0];
        };    
    };
} forEach unitArray;

//Delete empty groups
{
    deleteGroup _x;
} forEach (allGroups select {count (units _x) == 0});

//Spawn units that need spawning
_time = 0;
{
    [{
        params["_arg", "_realVehicles"];
        _array = _arg select 1;
        //Group
        _group = [_array select 1] call JOC_coreGetGroup;
        if (isNull _group) then {
            _group = createGroup (_array select 8);
            _group setVariable ["id", _array select 1, true];
        };

        //Create unit
        _unit = _group createUnit [_array select 4, [0, 0, 0], [], 0, "CAN_COLLIDE"];
        _unit setVariable ["id", (_array select 0), true];
        [_unit] joinSilent _group;
        _unit setPosAsl (_array select 2);
        _unit setDamage (_array select 6);
        _unit setVariable ["garrisoned", (_array select 10)];
        if (_array select 10) then {
            doStop (units _group);
        };
        _array set [4, _unit];

        //Vehicle (0:driver 1:commander 2:gunner)
        if (((_array select 3) select 0) in _realVehicles) then {
            _vehicle = [(_array select 3) select 0] call JOC_coreGetVehicle;
            switch(((_array select 3) select 1) select 0)do{
                case 0:{
                    _unit moveInDriver _vehicle;
                };
                case 1:{
                    _unit moveInCommander _vehicle;
                };
                case 2:{
                    _unit moveInGunner _vehicle;
                };
                case 3:{
                    _unit moveInTurret [_vehicle, ((_array select 3) select 1) select 1];
                };
                case 4:{
                    _unit moveInCargo [_vehicle, ((_array select 3) select 1) select 1];
                };
                case 5:{
                    _unit moveInAny _vehicle;
                };
                default {
                    _unit moveInAny _vehicle;
                };
            };
        };
        [[_arg select 0, _array], {unitArray set [_this select 0, _this select 1]}] remoteExecCall ["BIS_fnc_call", 0];
    }, [_x, _realVehicles], _time] call CBA_fnc_waitAndExecute;
    _time = _time + 0.01;
} forEach _createArray;

publicVariable "currentGroupId";
publicVariable "currentUnitId";
publicVariable "currentVehicleId";
//[false] call acex_headless_fnc_rebalance;
