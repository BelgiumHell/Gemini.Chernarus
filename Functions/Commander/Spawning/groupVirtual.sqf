/////////////////////////
//Script made by Jochem//
/////////////////////////
params ["_pos","_unitCount","_pool","_garrison","_skill"];

_poolCur = infantryPool;

switch(_pool)do{
    case 0: {
        _poolCur = infantryPool;
    };
};

_unitClasses = [];
_posArr = [];

if(_garrison select 0)then{
    _posArrOrg = ((_garrison select 1) buildingPos - 1);
    _posArr = [_posArrOrg select ((count _posArrOrg) - 1)];
    _posArrOrg deleteAt ((count _posArrOrg) - 1);
    _posArr append (_posArrOrg call BIS_fnc_arrayShuffle);
};

_i = 0;
while{_i < _unitCount}do{


    if(_garrison select 0)then{
        if(count _posArr <= _i)then{
            _posArr pushBack (AGLToASL ((getPos (_garrison select 1)) findEmptyPosition [0,500]));
        };
        _unitClasses pushBack [(selectRandom _poolCur),AGLToASL (_posArr select _i),_skill];
    }else{
        _unitClasses pushBack [(selectRandom _poolCur),_pos,_skill];
    };
    _i = _i + 1;
};

_unitClasses