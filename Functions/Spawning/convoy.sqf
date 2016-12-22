
/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_startPos","_vehArr","_prefDir"];


_groupConvoy = createGroup east;
[_groupConvoy]call JOC_setGroupID;
_groups = [];

//Pause caching
JOC_pauseCache = true;

//Spawn all vehicles
_pos = getPos ((_startPos nearRoads 200) select 0);
_dir = ([_pos] call Zen_FindRoadDirection) + 90;


{
    _nearRoad = [_pos, _pos nearRoads 15]call JOC_getNearest;
    if(!isNull _nearRoad)then{
        _pos = getPos _nearRoad;
        _dir = ([_pos] call Zen_FindRoadDirection) + 90;
    };
    
    if(_dir < 0)then{
        _dir = 360 + _dir;
    };

    if(_dir - _prefDir > (360 - _dir) - _prefDir)then{
        _dir = (360 - _dir);
    };

    _veh = createVehicle[_x, _pos, [], 0, "CAN_COLLIDE"];
    _pos = [_pos, -15, _dir]call Zen_ExtendPosition;
    _veh setDir _dir;
    _veh setDamage 0;
    createVehicleCrew _veh;
    (crew _veh) joinSilent _groupConvoy;

    _group = [[0,0,0], east, "infantry", count(getArray(configFile >> "CfgVehicles" >> _x >> "getInProxyOrder")) - (count (crew _veh)),"Basic"]call Zen_SpawnInfantry;
    {
        _x moveInCargo _veh;
    }forEach (units _group);
    _groups pushBack _group;
} forEach _vehArr;

_groupConvoy setBehaviour "SAFE";
_groupConvoy setFormation "COLUMN";
_groupConvoy setSpeedMode "normal";

//Give all groups an ID
{
    [_x]call JOC_setGroupID;
} forEach _groups;

_return = [_groupConvoy,_groups];

JOC_pauseCache = false;

_return
