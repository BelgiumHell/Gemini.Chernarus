/////////////////////////
//Script made by Jochem//
/////////////////////////
//Set up var
_x = 0;
_y = 0;
_ok = 0;
_name = [5] call Zen_StringGenerateRandom;

//Get position
_targetTown =  opTownMarkers call BIS_fnc_selectRandom;
_location = getMarkerPos (_targetTown);

//Create task
_task = [west, "A journalist Journalist has been taken hostage by enemy SOF. Attempts to negotiate with them have unfortunately failed and plans are made to move him to Iran. This could have a big influence on public opinions, something we cannot afford at all. Rescue him and return him to the Return point","Rescue journalist",_location,true,"",_name] call Zen_InvokeTask;

//Create marker
_marker = createMarker [_name, _location];
_name setMarkerType "mil_objective";
_name setMarkerColor "ColorOPFOR";

//Spawn hostage
_locationS = [_location,[0,50],0,1,[1,150]] call Zen_FindGroundPosition;

_groupHostage = createGroup civilian;
_civ = _groupHostage createUnit ["C_journalist_F",_locationS, [], 0, "NONE"];
_civ allowFleeing 0;
_locationHostage = _locationS;
_civ setPos _locationHostage;

//Hostage set behaviour
_civ setBehaviour "Careless";
doStop _civ;
commandStop _civ;
_civ switchMove "AmovPercMstpSsurWnonDnon";

//Spawn enemy
[_locationHostage, east, "sof", 4,"SF"] call Zen_SpawnInfantry;

//Wait until complete or failed
waitUntil {(!alive _civ) or ((_civ distance respawn_obj) < 10)};

if (!alive _civ) then{
    [_name, "failed"] call Zen_UpdateTask;
};

if ((_civ distance respawn_obj) < 10) then{
    [_name, "succeeded"] call Zen_UpdateTask;
};
sleep 15;


//Cleanup
deleteVehicle _civ;
deleteMarker _marker;
taskActive = 0;
