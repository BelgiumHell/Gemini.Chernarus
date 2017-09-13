/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_arg"];

_nearPos = [(_arg select 0), "", [100, 99999]] call JOC_cmdMiscGetNearestStrategic;

_entities = _nearPos nearEntities [["Man", "Car", "Tank"], ((getMarkerSize (_arg select 3)) select 0)];

_availableArray = [];
{
    if (side _x == east) then {
        _availableArray pushBack _x;
    };
} forEach _entities;

{
    _x doMove [_near, random 100, random 100] call BIS_fnc_relPos;
} forEach _availableArray;
