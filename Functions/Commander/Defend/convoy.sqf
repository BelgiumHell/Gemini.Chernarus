/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_arg","_category"];

_truckCount = _category * 2 - random 2;
_apcCount = _category + random 1;

//Get start pos
_startP = [0,0,0];
_posArray = [];
{
    if((_x select 2) == "base" && (_x select 4) == east)then{
        _posArray pushBack (_x select 0);
    };
} forEach strategicArray;
_prevDis = 999999;
{
    if(((_arg select 0) distance2D _x) < _prevDis)then{
        _prevDis = ((_arg select 0) distance2D _x);
        _startP = _x;
    };
} forEach _posArray;

_groupConvoy = createGroup east;
_groups = [];

//Pause caching
JOC_pauseCache = true;

_x = 0;
//cars
while{_x < _truckCount} do{
    _locationS = [_startP,[0,400],0,1,[1,400]] call Zen_FindGroundPosition;
    _class = (truckPool call BIS_fnc_selectRandom);
    _veh = [_locationS, _class] call Zen_SpawnVehicle;
    createVehicleCrew _veh;
	_group = [_locationS, east, "infantry", getNumber(configFile >> "CfgVehicles" >> _class >> "transportSoldier"),"Basic"] call Zen_SpawnInfantry;
    [_group,_veh] call Zen_MoveInVehicle;
	_veh setDamage 0;
    _groups pushBack _group;
    (crew _veh) join _groupConvoy;
    _x = _x + 1;
};

_x = 0;
//APC
while{_x < _apcCount} do{
    _locationS = [_startP,[0,400],0,1,[1,400]] call Zen_FindGroundPosition;
    _class = (apcPool call BIS_fnc_selectRandom);
    _veh = [_locationS,_class] call Zen_SpawnVehicle;
    createVehicleCrew _veh;
    _count = (_veh emptyPositions "cargo");
	_group = [_locationS, east, "infantry", getNumber(configFile >> "CfgVehicles" >> _class >> "transportSoldier"),"Basic"] call Zen_SpawnInfantry;
    [_group,_veh] call Zen_MoveInVehicle;
	_veh setDamage 0;
    _groups pushBack _group;
    (crew _veh) join _groupConvoy;
    _x = _x + 1;
};

(leader _groupConvoy) setVariable["JOC_caching_disabled",true];
{
    (leader _x) setVariable["JOC_caching_disabled",true];
} forEach _groups;

//Unpause caching
JOC_pauseCache = false;

_groupConvoy move (_arg select 0);
_groupConvoy setFormation "COLUMN";
_groupConvoy setSpeedMode "normal";

sleep 1800;
(leader _groupConvoy) setVariable["JOC_caching_disabled",false];
{
    (leader _x) setVariable["JOC_caching_disabled",false];
} forEach _groups;
