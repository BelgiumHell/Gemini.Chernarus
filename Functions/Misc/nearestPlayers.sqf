/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_pos","_radius","_blacklist"];

_nearestPlayers = [];
{
    diag_log (getPosASL _x);
    diag_log _pos;
    diag_log (getPosASL _x) distance _pos;
    if((getPosASL _x) distance _pos <= _radius && !(typeOf (vehicle _x) in _blacklist))then{
        _nearestPlayers pushBack _x;
    };
} forEach allPlayers;

_nearestPlayers
