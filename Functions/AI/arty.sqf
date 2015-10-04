/////////////////////////
//Script made by Jochem//
/////////////////////////
//Set up var
_count = _this select 0;
_name = [5] call Zen_StringGenerateRandom;

//Get position
_location = [];
while{count _location == 0}do{
    _pos = ["mrk_area",0,[airfieldMarkers + blackMarkers,[],[]],1,0] call Zen_FindGroundPosition;
    _location  = _pos findEmptyPosition [0,300,"rhs_2s3_tv"];
};

//Create marker
_marker = createMarker [_name, _location];
_name setMarkerType "o_art";
_name setMarkerSize [0.65, 0.65];

//Spawn arty
_dir = round random 360;
_locationS = [_location, random 60, random 60] call BIS_fnc_relPos;
_arty1 = [_locationS, "rhs_2s3_tv"] call Zen_SpawnVehicle;
createVehicleCrew _arty1;
_arty1 addEventHandler["fired", {(_this select 0) setVehicleAmmo 1}];
_arty1 setFuel 0;
_arty1 setVariable["JOC_caching_disabled",true];

_dir = round random 360;
_locationS = [_location, random 60, random 60] call BIS_fnc_relPos;
_arty2 = [_locationS, "rhs_2s3_tv"] call Zen_SpawnVehicle;
createVehicleCrew _arty2;
_arty2 addEventHandler["fired", {(_this select 0) setVehicleAmmo 1}];
_arty2 setFuel 0;
_arty2 setVariable["JOC_caching_disabled",true];

[_arty1,_arty2] join artyGroup;

//Spawn enemy's
_trg = createTrigger ["EmptyDetector",_location,true];
_trg setTriggerArea [600,600,600,false];
_trg setTriggerActivation ["WEST","PRESENT", false];
_trg setTriggerStatements ["(!((typeOf (thisList select 0)) in jetArray)) OR ((count thisList) > 1)","[getPos thisTrigger,350,[4,true],[0,false],[0,false],[1,false],[0,false],[0,false,""cas""],[0,false]] call JOC_spawnZone;",""];
_trg setTriggerTimeout [5,5,5,true];

waitUntil{!alive _arty1 && !alive _arty2};

deleteMarker _name;
