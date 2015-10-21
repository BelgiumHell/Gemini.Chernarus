/////////////////////////
//Script made by Jochem//
/////////////////////////
params ["_units"];

_group = createGroup east;
_units joinSilent _group;
_group selectLeader (_units select 0);

{
    _x enableSimulationGlobal true;
    _x hideObjectGlobal false;
} forEach _units;

cachedArray = cachedArray - [_units];
