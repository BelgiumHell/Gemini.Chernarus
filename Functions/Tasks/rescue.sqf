/////////////////////////
//Script made by Jochem//
/////////////////////////
//Set up var
rescued = 0;
dead = 0;
_x = 0;
_y = 0;
_ok = 0;
_name = [5] call Zen_StringGenerateRandom;


//Get position
_targetTown =  opTownMarkers call BIS_fnc_selectRandom;
_location = getMarkerPos (_targetTown);

//Set location for triggers
_missionDropoffzone = getMarkerPos "mrk_return";


//Create task
_task = [west, "A journalist Journalist has been taken hostage by enemy SOF. Attempts to negotiate with them have unfortunately failed and plans are made to move him to Iran. This could have a big influence on public opinions, something we cannot afford at all. Rescue him and return him to the Return point","Rescue journalist",_location,true,"",_name] call Zen_InvokeTask;


//Create marker
_marker = createMarker [_name, _location];
_name setMarkerType "mil_objective";
_name setMarkerColor "ColorOPFOR";


//Spawn hostage
_locationS = [_location,[0,50],0,1,[1,150]] call Zen_FindGroundPosition;

_groupHostage = createGroup civilian;
CIV = _groupHostage createUnit ["C_journalist_F",_locationS, [], 0, "NONE"];
CIV allowFleeing 0;
_locationHostage = _locationS;
CIV setPos _locationHostage;

//Hostage set behaviour
CIV setBehaviour "Careless";
doStop CIV;
commandStop CIV;
CIV switchMove "AmovPercMstpSsurWnonDnon";

//Spawn enemy
[_locationHostage, east, "sof", 4,"SF"] call Zen_SpawnInfantry;

//Spawn dropoff trigger
_trgdrop = createTrigger ["EmptyDetector",_missionDropoffzone];
_trgdrop setTriggerArea [50,50,50,false];
_trgdrop setTriggerActivation ["CIV","PRESENT", false];
_trgdrop setTriggerStatements ["{[thisTrigger, _x]call BIS_fnc_inTrigger}count [CIV, blu_hostage_2] > 0","rescued = 1",""];


//Spawn dead trigger
_trgdead = createTrigger ["EmptyDetector",_missionDropoffzone];
_trgdead setTriggerStatements ["!alive CIV","dead = 1",""];


//Wait until complete or failed
waitUntil {dead == 1 or rescued == 1};

if ( dead == 1) then{
    [_name, "failed"] call Zen_UpdateTask;
};

if ( rescued == 1) then{
    [_name, "succeeded"] call Zen_UpdateTask;
};
sleep 15;


//Cleanup
deleteVehicle CIV;
deleteMarker _marker;
taskActive = 0;
