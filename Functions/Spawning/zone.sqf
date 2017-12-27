/////////////////////////
//Script made by Jochem//
/////////////////////////
//[amount(SCALAR), patrol(BOOLEAN)] heli:[amount(SCALAR), patrol(BOOLEAN), type(STRING)]
params["_location", "_dimensions", "_inf", "_car", "_apc", "_ifv", "_tank", "_heli", "_boat"];

_groups = [];

if ((typeName _dimensions) == "SCALAR") then {
	_var = _dimensions;
	_dimensions = [_var, _var, 0];
};

_spawnMarkerName = [4] call Zen_StringGenerateRandom;
_spawnMarker = createMarker [_spawnMarkerName, _location];
_spawnMarkerName setMarkerSize [(_dimensions select 0), (_dimensions select 1)];
_spawnMarkerName setMarkerShape "RECTANGLE";
_spawnMarkerName setMarkerDir (_dimensions select 2);
_spawnMarkerName setMarkerAlpha 0;

_roadArr = _location nearRoads (_dimensions select 0);
_roadPos = [];
{
    if ([_x, _spawnMarkerName] call Zen_AreInArea) then {
        _roadPos pushBack (getPosASL _x);
    };
} forEach _roadArr;
[_roadPos] call Zen_ArrayShuffle;
_roadCount = 0;

//Spawn infantry
if ((_inf select 0) > 0) then {
	for "_j" from 0 to (_inf select 0) step 1 do {
		_locationS = [_spawnMarkerName] call Zen_FindGroundPosition;
		_id = [_locationS, 4, 0, [false, objNull], 0.6] call JOC_spawnGroup;

		_groups pushBack _id;
	};
};

//Spawn cars
if ((_car select 0) > 0) then {
	for "_j" from 0 to (_car select 0) step 1 do {
	    _class = selectRandom poolCar;

	    _locationS = [_spawnMarkerName] call Zen_FindGroundPosition;
	    if (count _roadPos > _roadCount) then {
		    _locationS = _roadPos select _roadCount;
		    _roadCount = _roadCount + 1;
		} else {
		    _locationS = AGLToASL (_locationS findEmptyPosition [0, 100, _class]);
		};

		_idG = [_locationS, getNumber(configFile >> "CfgVehicles" >> _class >> "transportSoldier"), 0, [false, objNull], 0.6] call JOC_spawnGroup;
		_idV = [_class, _locationS, true, 0] call JOC_spawnVehicle;

		{
			_x set [3, [_idV, [5, 0]]];
		} forEach (unitArray select {_x select 1 == _idG});

		_groups pushBack _idG;
	};
};

//Spawn apc's
if ((_apc select 0) > 0) then {
	for "_j" from 0 to (_apc select 0) step 1 do {
	    _class = selectRandom poolApc;

	    _locationS = [_spawnMarkerName] call Zen_FindGroundPosition;
	    if (count _roadPos > _roadCount) then {
		    _locationS = _roadPos select _roadCount;
		    _roadCount = _roadCount + 1;
		} else {
		    _locationS = AGLToASL (_locationS findEmptyPosition [0, 100, _class]);
		};

		_idG = [_locationS, 3, 2, [false, objNull], 0.6] call JOC_spawnGroup;
		_idV = [_class, _locationS, true, 0] call JOC_spawnVehicle;

		{
			_x set [3, [_idV, [_forEachIndex, 0]]];
		} forEach (unitArray select {_x select 1 == _idG});

		_groups pushBack _idG;
	};
};

//Spawn ifv's
if ((_ifv select 0) > 0) then {
	for "_j" from 0 to (_ifv select 0) step 1 do {
	    _class = selectRandom poolIfv;

	    _locationS = [_spawnMarkerName] call Zen_FindGroundPosition;
	    if (count _roadPos > _roadCount) then {
		    _locationS = _roadPos select _roadCount;
		    _roadCount = _roadCount + 1;
		} else {
		    _locationS = AGLToASL (_locationS findEmptyPosition [0, 100, _class]);
		};

		_idG = [_locationS, 3, 2, [false, objNull], 0.6] call JOC_spawnGroup;
		_idV = [_class, _locationS, true, 0] call JOC_spawnVehicle;

		{
			_x set [3, [_idV, [_forEachIndex, 0]]];
		} forEach (unitArray select {_x select 1 == _idG});

		_groups pushBack _idG;
	};
};

//Spawn tanks
if ((_tank select 0) > 0) then {
	for "_j" from 0 to (_tank select 0) step 1 do {
	    _class = selectRandom poolTank;

	    _locationS = [_spawnMarkerName] call Zen_FindGroundPosition;
	    if (count _roadPos > _roadCount) then {
		    _locationS = _roadPos select _roadCount;
		    _roadCount = _roadCount + 1;
		} else {
		    _locationS = AGLToASL (_locationS findEmptyPosition [0, 100, _class]);
		};

		_idG = [_locationS, 3, 2, [false, objNull], 0.6] call JOC_spawnGroup;
		_idV = [_class, _locationS, true, 0] call JOC_spawnVehicle;

		{
			_x set [3, [_idV, [_forEachIndex, 0]]];
		} forEach (unitArray select {_x select 1 == _idG});

		_groups pushBack _idG;
	};
};

//Spawn heli's
_heliCount = (_heli select 0);
_heliPatrol = (_heli select 1);
_heliType = (_heli select 2);
_pool = [];
if (_heliCount > 0) then {
	for "_j" from 0 to (_heliCount select 0) step 1 do {
		_locationS = [_spawnMarkerName] call Zen_FindGroundPosition;
		if (_heliType == "transport") then {
			_pool = poolAir;
		};
		if (_heliType == "cas") then {
			_pool = poolCas;
		};

		_idG = [_locationS, 3, 2, [false, objNull], 0.6] call JOC_spawnGroup;
		_idV = [_class, _locationS, true, 0] call JOC_spawnVehicle;

		{
			_x set [3, [_idV, [_forEachIndex, 0]]];
		} forEach (unitArray select {_x select 1 == _idG});

		_groups pushBack _idG;
	};
};
/*
//Spawn boats
_boatCount = (_boat select 0);
_boatPatrol = (_boat select 1);
_j = 0;
if (_boatCount > 0) then {
	while{_j < _boatCount} do{
		_locationS = [_spawnMarkerName, 0, 0, 2] call Zen_FindGroundPosition;
		_boatV = [_locationS, ["O_Boat_Armed_01_hmg_F"], false] call Zen_SpawnBoat;
		_j = _j + 1;
	};
};*/

deleteMarker _spawnMarkerName;
_groups
