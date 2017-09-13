/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_pos","_radius","_blacklist","_knows"];

if (isNil{_knows}) then {
    _knows = [false,objNull];
};

_nearestPlayers = [];
{
    _player = _x;
    if ((getPosASL _player) distance _pos <= _radius && count (_blacklist select {(vehicle _player) isKindOf _x}) == 0) then {
        if (_knows select 0) then {
            if ((_knows select 1) knowsAbout _player > 2 || (_knows select 1) knowsAbout (vehicle _player) > 2) then {
                _nearestPlayers pushBack _player;
            };
        }else{
            _nearestPlayers pushBack _player;
        };
    };
} forEach allPlayers;

_nearestPlayers
