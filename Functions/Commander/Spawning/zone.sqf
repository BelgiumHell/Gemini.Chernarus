/////////////////////////
//Script made by Jochem//
/////////////////////////
//[amount(SCALAR),patrol(BOOLEAN)] heli:[amount(SCALAR),patrol(BOOLEAN),type(STRING)]
params["_location","_dimensions","_inf","_car","_apc","_ifv","_tank","_heli","_boat"];

_groups = [];

if((typeName _dimensions) == "SCALAR")then{
	_var = _dimensions;
	_dimensions = [_var,_var,0];
};

_spawnMarkerName = [4] call Zen_StringGenerateRandom;
_spawnMarker = createMarker [_spawnMarkerName,_location];
_spawnMarkerName setMarkerSize [(_dimensions select 0),(_dimensions select 1)];
_spawnMarkerName setMarkerShape "RECTANGLE";
_spawnMarkerName setMarkerDir (_dimensions select 2);
_spawnMarkerName setMarkerAlpha 0;

//Spawn infantry
_j = 0;
if((_inf select 0) > 0)then{
	while{_j < (_inf select 0)} do{
		_locationS = [_spawnMarkerName] call Zen_FindGroundPosition;
		_locationS = [_locationS,1,1] call Zen_ExtendPosition;
		_array = [_locationS, east, "infantry", 4,"Basic"] call Zen_SpawnInfantryVirtual;
		virtualizedArray pushBack [_array,[],false,-1,[[]]];
		_groups pushBack ((count virtualizedArray) - 1);
		_j = _j + 1;
	};
};

//Spawn cars
_j = 0;
if((_car select 0) > 0)then{
	while{_j < (_car select 0)} do{
		_locationS = [_spawnMarkerName,0,0,1,[1,100]] call Zen_FindGroundPosition;
		_class = (carPool call BIS_fnc_selectRandom);
		_arrayG = [_locationS, east, "infantry", getNumber(configFile >> "CfgVehicles" >> _class >> "transportSoldier"),"Basic"] call Zen_SpawnInfantryVirtual;
		_arrayI = [];
		{
		    _arrayI pushBack _forEachIndex;
		} forEach _arrayG;
		_array = [_arrayG,[[_locationS,_class,_arrayI,[[],[]],1]],false,-1,[[]]];
		virtualizedArray pushBack _array;
		_groups pushBack ((count virtualizedArray) - 1);
		_j = _j + 1;
	};
};

//Spawn apc's
_j = 0;
if((_apc select 0) > 0)then{
	while{_j < (_apc select 0)} do{
		_locationS = [_spawnMarkerName,0,0,1,[1,100]] call Zen_FindGroundPosition;
		_array = [[[crewClass,_locationS],[crewClass,_locationS],[crewClass,_locationS]],[[_locationS,(apcPool call BIS_fnc_selectRandom),[0,1,2],[[],[]],1]],false,-1,[[]]];
		virtualizedArray pushBack _array;
		_groups pushBack ((count virtualizedArray) - 1);
		_j = _j + 1;
	};
};

//Spawn ifv's
_j = 0;
if((_ifv select 0) > 0)then{
	while{_j < (_ifv select 0)} do{
		_locationS = [_spawnMarkerName,0,0,1,[1,100]] call Zen_FindGroundPosition;
		_array = [[[crewClass,_locationS],[crewClass,_locationS],[crewClass,_locationS]],[[_locationS,(ifvPool call BIS_fnc_selectRandom),[0,1,2],[[],[]],1]],false,-1,[[]]];
		virtualizedArray pushBack _array;
		_groups pushBack ((count virtualizedArray) - 1);
		_j = _j + 1;
	};
};

//Spawn tanks
_j = 0;
if((_tank select 0) > 0)then{
	while{_j < (_tank select 0)} do{
		_locationS = [_spawnMarkerName,0,0,1,[1,100]] call Zen_FindGroundPosition;
		_array = [[[crewClass,_locationS],[crewClass,_locationS],[crewClass,_locationS]],[[_locationS,(tankPool call BIS_fnc_selectRandom),[0,1,2],[[],[]],1]],false,-1,[[]]];
		virtualizedArray pushBack _array;
		_groups pushBack ((count virtualizedArray) - 1);
		_j = _j + 1;
	};
};

//Spawn heli's
_heliCount = (_heli select 0);
_heliPatrol = (_heli select 1);
_heliType = (_heli select 2);
_j = 0;
_pool = [];
if(_heliCount > 0)then{
	while{_j < _heliCount} do{
		_locationS = [_spawnMarkerName] call Zen_FindGroundPosition;
		if(_heliType == "transport")then{
			_pool = heliPool;
		};
		if(_heliType == "cas")then{
			_pool = casPool
		};
		_array = [[[pilotClass,_locationS],[pilotClass,_locationS]],[[_locationS,(_pool call BIS_fnc_selectRandom),[0,1,2]]],false,-1,[[]]];
		virtualizedArray pushBack _array;
		_groups pushBack ((count virtualizedArray) - 1);
		_j = _j + 1;
	};
};

//Spawn boats
_boatCount = (_boat select 0);
_boatPatrol = (_boat select 1);
_j = 0;
if(_boatCount > 0)then{
	while{_j < _boatCount} do{
		_locationS = [_spawnMarkerName,0,0,2] call Zen_FindGroundPosition;
		_boatV = [_locationS,["O_Boat_Armed_01_hmg_F"],false] call Zen_SpawnBoat;
		_j = _j + 1;
	};
};

deleteMarker _spawnMarkerName;
_groups
