/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_pos","_type","_minDistance"];

_posArray = [];
{
    if(((_x select 2) == _type || _type == "") && (_x select 4) == east)then{
        _posArray pushBack (_x select 0);
    };
} forEach strategicArray;
_prevDis = 999999;
_closeP = [0,0,0];
{
    if((_pos distance2D _x) < _prevDis && (_pos distance2D _x) > _minDistance)then{
        _prevDis = (_pos distance2D _x);
        _closeP = _x;
    };
} forEach _posArray;

_closeP
