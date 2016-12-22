/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_pos","_radius","_blacklist"];

_near = false;
{
    _player = _x;
    if((getPosWorld _player) distance _pos <= _radius && count (_blacklist select {(vehicle _player) isKindOf _x}) == 0)then{
        _near = true;
    };
} forEach allPlayers;

_near
