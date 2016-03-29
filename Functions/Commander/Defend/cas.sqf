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

//Spawn jet
JOC_pauseCache = true;
_array = _airfieldArray select 0;
_list = nearestObjects [(_array select 0), ["LocationRespawnPoint_F"], 1000];
_pos = getPos (_list select 0);
_jet = (jetPoolAG call BIS_fnc_selectRandom) createVehicle _pos;
_jet setDir (direction (_list select 0));
createVehicleCrew _jet;
(driver _jet) setVariable["JOC_caching_disabled",true];
JOC_pauseCache = false;

[_jet,_arg]spawn{
    params["_jet","_arg"];

    [(group _jet),(_arg select 0)] call BIS_fnc_taskAttack;

    waitUntil{(fuel _jet) < 0.15};
    _airfieldArray = [];
    {
        if((_x select 2) == "airfield" && (_x select 4) == east)then{
            _airfieldArray pushBack _x;
        };
    } forEach strategicArray;
    _array = _airfieldArray select 0;
    _id = parseNumber [(_array select 3),"mrk_airfield_","",true] call Zen_StringFindReplace;
    _jet landAt _id;

    waitUntil{sleep 20; speed _jet < 10};
    waitUntil{west countSide ((getPos _jet) nearEntities [["Man","Car","Tank","Helicopter"],1200]) == 0};
    deleteVehicle _jet;
};
