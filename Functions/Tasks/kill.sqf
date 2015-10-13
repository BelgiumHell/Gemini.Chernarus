/////////////////////////
//Script made by Jochem//
/////////////////////////
//var
_name = [5] call Zen_StringGenerateRandom;
detected = 0;
dead = 0;
evac = 0;
_ok = 0;


//location
_targetTown =  opTownMarkers call BIS_fnc_selectRandom;
_location = getMarkerPos (_targetTown);  

//Create task
_task = [west,"Intel shows the location of an enemy HVT. Move in, execute kill order and return to base.","Kill officer",_location,true,"",_name] call Zen_InvokeTask;


//Create marker
_marker = createMarker [_name, _location];
_name setMarkerType "mil_objective";
_name setMarkerColor "ColorOPFOR";

//Spawn officer
_locationS = [_location,[0,50],0,1,[1,150]] call Zen_FindGroundPosition;

_groupOfficer = createGroup east;
officer = _groupOfficer createUnit ["O_officer_F",_locationS, [], 0, "NONE"];
officer allowFleeing 0;

//Personal protection
_group = [_locationS, east, "infantry", 3,"basic"] call Zen_SpawnInfantry;
officer joinSilent _group;
officer setLeader _group;


//Spawn dead trigger
_trgdead = createTrigger ["EmptyDetector",_location];
_trgdead setTriggerStatements ["!alive officer","dead = 1",""];

//Spawn extract trigger
_trg = createTrigger ["EmptyDetector",_location];
_trg setTriggerArea [450,450,450,false];
_trg setTriggerActivation ["WEST","EAST D", false];
_trg setTriggerStatements ["this","detected = 1",""];

//Spawn fail trigger
_trgdrop = createTrigger ["EmptyDetector",(getMarkerPos "mrk_end")];
_trgdrop setTriggerArea [500,500,500,false];
_trgdrop setTriggerActivation ["EAST","PRESENT", false];
_trgdrop setTriggerStatements ["(officer distance thistrigger < 200)","evac = 1",""];

//Wait until complete or failed
waitUntil {dead == 1 or detected == 1};

if (detected == 1) then{
    []spawn JOC_taskKillExtract;
};

waitUntil {dead == 1 or evac == 1};
if ( evac == 1) then{
    [_name, "failed"] call Zen_UpdateTask;
};

if ( dead == 1) then{
    [_name, "succeeded"] call Zen_UpdateTask;
};
sleep 15;


//Cleanup
deleteVehicle officer;
deleteMarker _marker;
taskActive = 0;