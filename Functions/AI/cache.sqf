/////////////////////////
//Script made by Jochem//
/////////////////////////
params ["_group"];

if((leader _group) getVariable ["JOC_caching_disabled",false])exitWith{};

_units = units _group;

{
    if(vehicleVarName _x == "")then{
        _name = [10] call Zen_StringGenerateRandom;
        _x setVehicleVarName _name;
    };
    _x enableSimulationGlobal false;
    _x hideObjectGlobal true;
} forEach _units;

_units joinSilent cacheGroup;
deleteGroup _group;

cachedArray pushBack _units;
