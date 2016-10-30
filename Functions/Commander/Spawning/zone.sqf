/////////////////////////
//Script made by Jochem//
/////////////////////////
//[amount(SCALAR),patrol(BOOLEAN)] heli:[amount(SCALAR),patrol(BOOLEAN),type(STRING)]
params["_location","_dimensions","_inf","_car","_apc","_ifv","_tank","_heli","_boat"];

//Pause caching
JOC_pauseCache = true;

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

_roadArr = _location nearRoads (_dimensions select 0);
_roadPos = [];
{
    if([_x,_spawnMarkerName]call Zen_AreInArea)then{
        _roadPos pushBack (getPosASL _x);
    };
} forEach _roadArr;
[_roadPos] call Zen_ArrayShuffle;
_roadCount = 0;

//Spawn infantry
_j = 0;
if((_inf select 0) > 0)then{
	while{_j < (_inf select 0)} do{
		_locationS = [_spawnMarkerName]call Zen_FindGroundPosition;
		_array = [_locationS,4,0,[false,objNull],0.6]call JOC_cmdSpawnGroupVirtual;
		virtualizedArray pushBack [_array,[],false,[-1,false]];
		_groups pushBack ((count virtualizedArray) - 1);
		_j = _j + 1;
	};
};

//Spawn cars
_j = 0;
if((_car select 0) > 0)then{
	while{_j < (_car select 0)} do{
	    _class = selectRandom carPool;

	    _locationS = [_spawnMarkerName]call Zen_FindGroundPosition;
	    if(count _roadPos > _roadCount)then{
		    _locationS = _roadPos select _roadCount;
		    _roadCount = _roadCount + 1;
		}else{
		    _locationS = AGLToASL (_locationS findEmptyPosition [0,100,_class]);
		};

		_arrayG = [_locationS,getNumber(configFile >> "CfgVehicles" >> _class >> "transportSoldier"),0,[false,objNull],0.6]call JOC_cmdSpawnGroupVirtual;
		_arrayI = [];
		{
		    _arrayI pushBack _forEachIndex;
		} forEach _arrayG;
		_array = [_arrayG,[[_class,_locationS,_arrayI,0,1]],false,[-1,false]];
		virtualizedArray pushBack _array;
		_groups pushBack ((count virtualizedArray) - 1);
		_j = _j + 1;
	};
};

//Spawn apc's
_j = 0;
if((_apc select 0) > 0)then{
	while{_j < (_apc select 0)} do{
	    _class = selectRandom apcPool;

	    _locationS = [_spawnMarkerName]call Zen_FindGroundPosition;
	    if(count _roadPos > _roadCount)then{
		    _locationS = _roadPos select _roadCount;
		    _roadCount = _roadCount + 1;
		}else{
		    _locationS = AGLToASL (_locationS findEmptyPosition [0,100,_class]);
		};

		_array = [[[crewClass,_locationS,0.6],[crewClass,_locationS,0.6],[crewClass,_locationS,0.6]],[[_class,_locationS,[0,1,2],0,1]],false,[-1,false]];
		virtualizedArray pushBack _array;
		_groups pushBack ((count virtualizedArray) - 1);
		_j = _j + 1;
	};
};

//Spawn ifv's
_j = 0;
if((_ifv select 0) > 0)then{
	while{_j < (_ifv select 0)} do{
	    _class = selectRandom ifvPool;

	    _locationS = [_spawnMarkerName]call Zen_FindGroundPosition;
	    if(count _roadPos > _roadCount)then{
		    _locationS = _roadPos select _roadCount;
		    _roadCount = _roadCount + 1;
		}else{
		    _locationS = AGLToASL (_locationS findEmptyPosition [0,100,_class]);
		};
		_array = [[[crewClass,_locationS,0.6],[crewClass,_locationS,0.6],[crewClass,_locationS,0.6]],[[_class,_locationS,[0,1,2],0,1]],false,[-1,false]];
		virtualizedArray pushBack _array;
		_groups pushBack ((count virtualizedArray) - 1);
		_j = _j + 1;
	};
};

//Spawn tanks
_j = 0;
if((_tank select 0) > 0)then{
	while{_j < (_tank select 0)} do{
	    _class = selectRandom tankPool;

	    _locationS = [_spawnMarkerName]call Zen_FindGroundPosition;
	    if(count _roadPos > _roadCount)then{
		    _locationS = _roadPos select _roadCount;
		    _roadCount = _roadCount + 1;
		}else{
		    _locationS = AGLToASL (_locationS findEmptyPosition [0,100,_class]);
		};

		_array = [[[crewClass,_locationS,0.6],[crewClass,_locationS,0.6],[crewClass,_locationS,0.6]],[[_class,_locationS,[0,1,2],0,1]],false,[-1,false]];
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
			_pool = casPool;
		};
		_array = [[[pilotClass,_locationS],[pilotClass,_locationS]],[[selectRandom _pool,_locationS,[0,1,2]]],false,[-1,false]];
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

JOC_pauseCache = false;

deleteMarker _spawnMarkerName;
_groups
