/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_pos","_radius","_blacklist"];

_near = false;
{
    if((getPosASL _x) distance _pos <= _radius && !(typeOf (vehicle _x) in _blacklist))exitWith{_near = true};
} forEach allPlayers;

_near
