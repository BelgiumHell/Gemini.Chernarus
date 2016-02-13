
/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_startPos","_vehArr"];


_groupConvoy = createGroup east;
_groups = [];

//Pause caching
JOC_pauseCache = true;

//Spawn all vehicles
{
    _veh = _x createVehicle _startPos;
    _veh setDamage 0;
    createVehicleCrew _veh;

    _group = [[0,0,0], east, "infantry", getNumber(configFile >> "CfgVehicles" >> _class >> "transportSoldier"),"Basic"] call Zen_SpawnInfantry;
    [_group,_veh] call Zen_MoveInVehicle;
    (units _group) joinSilent (group _veh);

    (units (group _veh)) joinSilent _groupConvoy;
} forEach _vehArr;

(leader _groupConvoy) setVariable["JOC_caching_disabled",true];

JOC_pauseCache = false;

_groupConvoy setBehaviour "SAFE";
_groupConvoy setFormation "COLUMN";
_groupConvoy setSpeedMode "normal";

_groupConvoy
