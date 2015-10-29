/////////////////////////
//Script made by Jochem//
/////////////////////////
params ["_units"];

{
    if(vehicleVarName _x == "")then{
        _name = [10] call Zen_StringGenerateRandom;
        _x setVehicleVarName _name;
    };
    _x enableSimulationGlobal false;
    _x hideObjectGlobal true;
} forEach _units;

_units joinSilent cacheGroup;

cachedArray pushBack _units;
