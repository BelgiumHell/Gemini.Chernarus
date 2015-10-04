/////////////////////////
//Script made by Jochem//
/////////////////////////
_tower = _this select 0;
_location = getPos _tower;

//Create marker
_name = [5] call Zen_StringGenerateRandom;
_marker = createMarker [_name, _location];
_name setMarkerType "loc_Transmitter";
_name setMarkerColor "ColorOPFOR";
_name setMarkerSize [0.65, 0.65];

//Spawn enemy's
_trg = createTrigger ["EmptyDetector",_location,true];
_trg setTriggerArea [600,600,600,false];
_trg setTriggerActivation ["WEST","PRESENT", false];
_trg setTriggerStatements ["(!((typeOf (thisList select 0)) in jetArray)) OR ((count thisList) > 1)","[getPos thisTrigger,600,[4,true],[0,false],[0,false],[1,false],[0,false],[0,false,""cas""],[0,false]] call JOC_spawnZone;",""];
_trg setTriggerTimeout [5,5,5,true];

waitUntil{!alive _tower};

deleteMarker _name;
