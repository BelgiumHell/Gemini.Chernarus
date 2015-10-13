/////////////////////////
//Script made by Jochem//
/////////////////////////
_name = [5] call Zen_StringGenerateRandom;
launched = 0;

//location
_location = getMarkerPos "mrk_airfield_0";//["mrk_area",0,[airfieldMarkers + blackMarkers,[],[]],1,0,0,[1,0,10],0,0,[1,5,5],[1,[10,-1,-1],120]] call Zen_FindGroundPosition;

//Create task
_text = "Russian forces are preparing a nuclear attack. ROE on the vehicle is hold fire, since it is likely the nuke will go off if it gets blown up";
_task = [west,_text,"Prevent launch",_location,true,"",_name] call Zen_InvokeTask;

//Create marker
_marker = createMarker [_name, _location];
_name setMarkerType "hd_objective";
_name setMarkerColor "ColorOPFOR";

//Spawn icbm
_icbm = [_location, "rhs_9k79_B"] call Zen_SpawnVehicle;
[_icbm,east] call Zen_SpawnVehicleCrew;
sleep 1;
[_icbm,1] spawn rhs_fnc_ss21_AI_prepare;

//Spawn enemy's
_trg = createTrigger ["EmptyDetector",_location,true];
_trg setTriggerArea [900,900,900,false];
_trg setTriggerActivation ["WEST","PRESENT", false];
_trg setTriggerStatements ["this","[getPos thisTrigger,300,[5,true],[2,false],[0,false],[2,false],[0,false],[1,false,""cas""],[0,false]] spawn JOC_spawnZone; deleteVehicle thisTrigger",""];
_trg setTriggerTimeout [5,5,5,true];

[600,_icbm]execVM "Functions\Tasks\Functions\countdown.sqf";

//Wait until complete
waitUntil{(!alive (crew icbm select 0) && !alive (crew icbm select 1)) or (launched == 1) or (!alive _icbm)};

if (!alive (crew icbm select 0) && !alive (crew icbm select 1)) then{
    [_name, "succeeded"] call Zen_UpdateTask;
};

if (launched == 1) then{
    [_name, "failed"] call Zen_UpdateTask;
    [_icbm,cacheGroupLeader]spawn RHS_fnc_ss21_AI_launch
};

if (!alive _icbm) then{
    [_name, "failed"] call Zen_UpdateTask;
    [_location,10000,1000] call rhs_fnc_ss21_nuke
};

sleep 15;

deleteMarker _marker;
taskActive = 0;
