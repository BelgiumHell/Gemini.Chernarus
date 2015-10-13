/////////////////////////
//Script made by Jochem//
/////////////////////////
//Set up var
_name = [5] call Zen_StringGenerateRandom;
_ok = 0;
_location = 0;

//Get position
while{_ok == 0}do{
    _location       = ["mrk_area",0,[airfieldMarkers + blackMarkers,[],[]],1,0,0,[1,0,10],0,0,[1,5,5],[1,[0,0,0],10]] call Zen_FindGroundPosition;
    _nearestPlayers = [];
    {
        if (isPlayer _x && _x distance _location < 1000) then {
            _nearestPlayers pushBack _x;
        };
    } forEach (playableUnits + switchableUnits);
    if(count _nearestPlayers == 0)then{_ok = 1;};
};

//Create marker
_marker = createMarker [_nameM, _location];
_nameM setMarkerType "mil_objective";
_nameM setMarkerColor "ColorOPFOR";


//Spawn chopper + crew
_chopper = [_location, "Land_Wreck_Heli_Attack_01_F"] call Zen_SpawnVehicle;

_locationP= [_location, random 20, random 20] call BIS_fnc_relPos;
_groupPilot = createGroup west;
sleep 20;
_pilot = _groupPilot createUnit ["B_Helipilot_F",_locationP, [], 0, "NONE"];
[_pilot, true, 9999] call ace_medical_fnc_setUnconscious;


//Create task markers
_location= [_location, random 150, random 150] call BIS_fnc_relPos;
_marker = createMarker [_name, _location];
_name setMarkerShape "RECTANGLE";
_name setMarkerSize [200,200];
_name setMarkerBrush "Solid";
_name setMarkerColor "ColorBLUFOR";

//Create task
_task = [west,"An experimental Comanche helicopter was shot down by OPFOR forces and made an emergency landing. Satellites spotted enemy forces assembling at the airfield witch are due to leave for the crash site.
Secure the crash site and extract the pilot","Secure downed Comanche",_location,true,"",_name] call Zen_InvokeTask;


[1800]spawn JOC_taskCrashBleedOut;

_x = 0;

//Spawn enemy's
_trg = createTrigger ["EmptyDetector",_location,true];
_trg setTriggerArea [900,900,900,false];
_trg setTriggerActivation ["WEST","PRESENT", false];
_trg setTriggerStatements ["this","[getPos thisTrigger,300,[4,true],[3,false],[0,false],[0,false],[0,false],[0,false,""cas""],[0,false]] spawn JOC_spawnZone; deleteVehicle thisTrigger",""];
_trg setTriggerTimeout [5,5,5,true];

_pilot allowDamage true;

waitUntil {(!alive _pilot) or ((_pilot distance respawn_obj) < 10)};


//Complete task
if((_pilot distance respawn_obj) < 10) then{
    [_name, "succeeded"] call Zen_UpdateTask;
};

if(!alive _pilot) then{
    [_name, "failed"] call Zen_UpdateTask;
};

sleep 5;

taskActive = 1;

//Cleanup
deleteMarker _marker;
deleteVehicle _pilot;
