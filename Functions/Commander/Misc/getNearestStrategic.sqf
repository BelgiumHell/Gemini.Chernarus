/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_pos","_type","_distance","_playerA"];

if(isNil{_playerA})then{
    _playerA = [true,1100];
};

_posArray = [];
{
    if(((_x select 2) == _type || _type == "") && (_x select 4) == 1)then{
        if(!(_playerA select 0))then{
            _posArray pushBack (_x select 0);
        }else{
            if(!([(_x select 0), (_playerA select 1), ["plane"]]call JOC_playersNear))then{
                _posArray pushBack (_x select 0);
            };
        };
    };
} forEach strategicArray;

_prevDis = 999999;
_closeP = [0,0,0];
{
    if((_pos distance2D _x) < _prevDis && (_pos distance2D _x) > (_distance select 0) && (_pos distance2D _x) < (_distance select 1))then{
        _prevDis = (_pos distance2D _x);
        _closeP = _x;
    };
} forEach _posArray;

_closeP
