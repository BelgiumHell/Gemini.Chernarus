/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_pos","_radius","_blacklist","_knows"];

if(isNil{_knows})then{
    _knows = false;
};

_nearestPlayers = [];
{
    if((getPosASL _x) distance _pos <= _radius && !(typeOf (vehicle _x) in _blacklist))then{
        if(_knows)then{
            if(east knowsAbout _x)then{
                _nearestPlayers pushBack _x;
            };
        }else{
            _nearestPlayers pushBack _x;
        };
    };
} forEach allPlayers;

_nearestPlayers
