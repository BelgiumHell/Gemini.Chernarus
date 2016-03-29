/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_array"];

_pos = _array select 0;

_objects = _pos nearEntities [["Man","Car","Tank","Helicopter"],3000];
_enemyCount = west countSide _objects;

if(_enemyCount < 0)then{
    [_array]spawn JOC_cmdLogTruck;
}else{
    [_array]spawn JOC_cmdLogHeli;
};
