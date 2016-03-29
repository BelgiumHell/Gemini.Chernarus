/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_arg","_category"];

_startPos = [(_arg select 0),"base",1200]call JOC_cmdMiscGetNearestStrategic;
if(count (_startPos - [0,0,0]) == 0)exitWith{false};

_vehArr = [];
switch (_category) do {
    case (1): {
        _vehArr = [(tankPool call BIS_fnc_selectRandom),(tankPool call BIS_fnc_selectRandom),(apcPool call BIS_fnc_selectRandom),(ifvPool call BIS_fnc_selectRandom)];
    };
    case (2): {
        _vehArr = [(tankPool call BIS_fnc_selectRandom),(apcPool call BIS_fnc_selectRandom)];
    };
};

//Spawn convoy
_groupConvoy = [_startPos,_vehArr]call JOC_cmdSpawnConvoy;
_groupConvoy move (_arg select 0);

sleep 1800;
(leader _groupConvoy) setVariable["JOC_caching_disabled",false];
