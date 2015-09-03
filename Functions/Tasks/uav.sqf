/////////////////////////
//Script made by Jochem//
/////////////////////////
//Set up var
_name = [5] call Zen_StringGenerateRandom;
hacked = 0;
destroyed = 0;
uavStart = 0;


//Get position
_location = [0,0,opTownMarkers,1,0,0,[1,0,10],0,0,[1,5,5],[1,[0,0,0],10]] call Zen_FindGroundPosition;


//Create task markers
_locationM= [_location, random 450, random 450] call BIS_fnc_relPos;
_marker = createMarker [_name, _locationM];
_name setMarkerShape "ELLIPSE";
_name setMarkerSize [500,500];
_name setMarkerBrush "Solid";
_name setMarkerColor "ColorOPFOR";

//Create marker
_marker = createMarker [_nameM, _location];
_nameM setMarkerType "mil_objective";
_nameM setMarkerColor "ColorOPFOR";


//Create task
_task = [west,"An enemy UAV has crash-landed somewhere near the marked location. It is believed to contain valuable intel. Find and secure the UAV, hack it, and then destroy it.","Hack UAV",_locationM,true,"",_name] call Zen_InvokeTask;


//Spawn uav + configure
uav = [_location, "O_UAV_02_F"] call Zen_SpawnVehicle;
uav setDamage 0.5;
uav setFuel 0;


//Spawn dead trigger
_trgdead = createTrigger ["EmptyDetector",_location];
_trgdead setTriggerStatements ["!alive uav","destroyed = 1",""];

_trgD = createTrigger ["EmptyDetector",_location];
_trgD setTriggerArea [10,10,10,false];
_trgD setTriggerActivation ["WEST","PRESENT", true];
_trgD setTriggerStatements ["this","",""];

waitUntil {sleep 5;count (list _trgD) > 0};

[_trgD]spawn JOC_taskUavDownload;

waitUntil {hacked == 1 or destroyed == 1};

if(hacked == 1)then{
    waitUntil {!alive uav};
    [_name, "succeeded"] call Zen_UpdateTask;
};

if(destroyed == 1 and hacked == 0)then{
    [_name, "failed"] call Zen_UpdateTask;
};


//Cleanup
taskActive = 0;

Sleep 15;

deleteMarker _marker;
deleteVehicle uav;