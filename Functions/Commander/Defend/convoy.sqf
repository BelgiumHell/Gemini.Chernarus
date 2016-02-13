/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_arg","_category"];

//Get nearest base
_startPos = [(_arg select 0),"base",1200]call JOC_cmdMiscGetNearestStrategic;

//Generate composition
_vehArr = [];
_truckCount = _category * 2 - random 2;
_apcCount = _category + random 1;
_i = 0;
while{_i < _apcCount}do{
    _vehArr pushBack (apcPool call BIS_fnc_selectRandom);
};
_i = 0;
while{_i < _truckCount}do{
    _vehArr pushBack (truckPool call BIS_fnc_selectRandom);
};

//Spawn convoy
_groupConvoy = [_startPos,_vehArr]call JOC_cmdSpawnConvoy;
_groupConvoy move (_arg select 0);

sleep 1800;
(leader _groupConvoy) setVariable["JOC_caching_disabled",false];
