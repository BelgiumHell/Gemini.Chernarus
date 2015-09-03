/////////////////////////
//Script made by Jochem//
/////////////////////////
_count = _this select 0;
_name = [5] call Zen_StringGenerateRandom;

_marker = format["mrk_aaZone_%1",_count];

//Get location
_location = [_marker,0,[airfieldMarkers + blackMarkers,["mrk_area"],[]],1,0,0,0,0,0,[1,10,50],[1,0,20]] call Zen_FindGroundPosition;

//Spawn tower
_tower = [_location, "Land_TTowerBig_2_F"] call Zen_SpawnVehicle;
zeusMod addCuratorEditableObjects [[_tower],false];

//Create marker
_marker = createMarker [_name, _location];
_name setMarkerType "loc_Transmitter";
_name setMarkerColor "ColorOPFOR";

//Spawn enemy's
_trg = createTrigger ["EmptyDetector",_location,true];
_trg setTriggerArea [600,600,600,false];
_trg setTriggerActivation ["WEST","PRESENT", false];
_trg setTriggerStatements ["(!((typeOf (thisList select 0)) in jetArray)) OR ((count thisList) > 1)","[getPos thisTrigger,600,[4,true],[0,false],[0,false],[1,false],[0,false],[0,false,""cas""],[0,false]] call JOC_spawnZone;",""];
_trg setTriggerTimeout [5,5,5,true];