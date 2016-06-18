/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_array"];

//Get nearest base
_startPos = [(_array select 0),"base",1200]call JOC_cmdMiscGetNearestStrategic;
if(count (_startPos - [0,0,0]) == 0)exitWith{false};

//Generate composition
_vehArr = [];
_vehArr pushBack (apcPool call BIS_fnc_selectRandom);
{
    _vehArr pushBack _x;
} forEach supportPool;

//Spawn convoy
_groupConvoy = [_startPos,_vehArr]call JOC_cmdSpawnConvoy;
_groupConvoy move (_array select 0);

[_thisScript,_groupConvoy]spawn{
    params["_script","_group"]
    waitUntil{sleep 24; (count (units _group) == 0)};
    terminate _script;
    terminate _thisScript;
};

waitUntil{sleep 20; ((leader _groupConvoy) distance2D (_array select 0) < 20) || (count (units _groupConvoy) == 0)};

sleep 300;
if(alive (leader _groupConvoy))then{
    _objects = east countSide ((getPos _crate) nearEntities [["Man","Car","Tank","Helicopter"],1200]);
    {
        _x setFuel 1;
        _x setVehicleAmmo 1;
        _x setDamage 0;
    } forEach _objects;
};

_groupConvoy move (_startPos);

waitUntil{sleep 20; ((leader _groupConvoy) distance2D _startPos < 20) || (count (units _groupConvoy) == 0)};

if(alive (leader _groupConvoy))then{
    waitUntil{west countSide ((getPos _jet) nearEntities [["Man","Car","Tank","Helicopter"],1200]) == 0};
    {
        deleteVehicle (vehicle _x);
        if(isNil{_x})then{
            deleteVehicle _x;
        };
    } forEach (units _groupConvoy);
};

//Convoy rtb
_heli land "LAND";
waitUntil{(getPosATL _heli) select 2 < 0.5};

//Delete convoy
waitUntil{west countSide (_startPos nearEntities [["Man","Car","Tank","Helicopter"],1200]) == 0};
{
    _veh = vehicle _x;
    {
        _veh deleteVehicleCrew _x
    } forEach crew _veh;
    deleteVehicle _veh;
} forEach (units _groupConvoy);
