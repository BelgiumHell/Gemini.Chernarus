/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_arg"];

//Find airfield
_airfieldArray = [];
{
    if((_x select 2) == "airfield" && (_x select 4) == east)then{
        _airfieldArray pushBack _x;
    };
} forEach strategicArray;

hint format["%1",_airfieldArray];

//Spawn jet
_array = _airfieldArray select 0;
_list = nearestObjects [(_array select 0), ["LocationRespawnPoint_F"], 1000];
_pos = getPos (_list select 0);
_jet = (jetPool call BIS_fnc_selectRandom) createVehicle _pos;
_jet setDir (direction (_list select 0));
createVehicleCrew _jet;
(driver _jet) setVariable["JOC_caching_disabled",true];

[(group _jet),(_arg select 0)] call BIS_fnc_taskAttack;
