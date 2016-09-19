
/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_startPos","_vehArr"];


_groupConvoy = createGroup east;
[_groupConvoy]call JOC_setGroupID;
_groups = [];

//Pause caching
JOC_pauseCache = true;

//Spawn all vehicles
_pos = getPos ((_startPos nearRoads 200) select 0);
_dir = [_pos] call Zen_FindRoadDirection;
{
    _veh = _x createVehicle _pos;
    _pos = [_pos, -15, _dir, "trig"]call Zen_ExtendPosition;
    _veh setDir _dir;
    _veh setDamage 0;
    createVehicleCrew _veh;

    _group = [[0,0,0], east, "infantry", getNumber(configFile >> "CfgVehicles" >> _x >> "transportSoldier"),"Basic"]call Zen_SpawnInfantry;
    {
        _x moveInAny _veh;
    }forEach (units _group);
    _groups pushBack _group;

    (crew _veh) joinSilent _groupConvoy;
} forEach _vehArr;

_groupConvoy setBehaviour "SAFE";
_groupConvoy setFormation "COLUMN";
_groupConvoy setSpeedMode "normal";

_return = [_groupConvoy,_groups];

JOC_pauseCache = false;

_return
