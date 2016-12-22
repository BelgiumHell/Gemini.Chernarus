/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_pos","_type","_distance","_playerA"];

if(isNil{_playerA})then{
    _playerA = [true,1100];
};

_stratArray = [];
{
    if(((_x select 2) == _type || _type == "") && (_x select 4) == 1)then{
        if(!(_playerA select 0))then{
            _stratArray pushBack _x;
        }else{
            if(!([(_x select 0), (_playerA select 1), ["plane"]]call JOC_playersNear))then{
                _stratArray pushBack _x;
            };
        };
    };
} forEach strategicArray;

_prevDis = 999999;
_closeStrat = [];
{
    if((_pos distance2D (_x select 0)) < _prevDis && (_pos distance2D (_x select 0)) > (_distance select 0) && (_pos distance2D (_x select 0)) < (_distance select 1))then{
        _prevDis = (_pos distance2D (_x select 0));
        _closeStrat = _x;
    };
} forEach _stratArray;

_closeStrat
