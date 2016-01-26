/////////////////////////
//Script made by Jochem//
/////////////////////////
//Find airfield
_airfieldArray = [];
{
    if((_x select 2) == "airfield" && (_x select 4) == east)then{
        _airfieldArray pushBack _x;
    };
} forEach strategicArray;

//Spawn jet
_array = _airfieldArray select 0;
_list = nearestObjects [(_array select 0), ["LocationRespawnPoint_F"], 1000];
_pos = getPos (_list select 0);
_jet = (jetPoolAA call BIS_fnc_selectRandom) createVehicle _pos;
_jet setDir (direction (_list select 0));
createVehicleCrew _jet;
(driver _jet) setVariable["JOC_caching_disabled",true];
[_jet]spawn{
    airTargets = airTargets - [objNull];
    if(count airTargets == 0)exitWith{
        jetActive = false;
    };

    _target = airTargets select 0;
    [(group _jet),_pos] call BIS_fnc_taskAttack;
    
    sleep 5;
};
