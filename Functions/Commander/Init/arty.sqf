/////////////////////////
//Script made by Jochem//
/////////////////////////
artyGroup = createGroup east;

_s = 0;
while{_s < 4}do{
	//Get position
	_location = [];
	while{count _location == 0}do{
	    _pos = ["mrk_area",0,[airfieldMarkers + blackMarkers,[],[]],1,0] call Zen_FindGroundPosition;
	    _location  = _pos findEmptyPosition [0,300,"O_MBT_02_arty_F"];
	};

	//Create marker
	_name = [5] call Zen_StringGenerateRandom;
	_marker = createMarker [_name, _location];
	_name setMarkerType "o_art";
	_name setMarkerSize [0.65, 0.65];

	_nameS = format ["mrk_strategic_arty_%1",_s];
	_marker = createMarker [_nameS, _location];
   	_nameS setMarkerShape "ELLIPSE";
   	_nameS setMarkerSize [100,100];
    _nameS setMarkerBrush "SolidBorder";
    _nameS setMarkerColor "ColorOpfor";

	strategicArray pushBack [_location,100,"arty",_nameS,east];

	//Spawn arty
	_dir = round random 360;
	_locationS = [_location, random 60, random 60] call BIS_fnc_relPos;
	_arty1 = [_locationS, "O_MBT_02_arty_F"] call Zen_SpawnVehicle;
	createVehicleCrew _arty1;
	_arty1 addEventHandler["fired", {(_this select 0) setVehicleAmmo 1}];
	_arty1 setFuel 0;
	(driver _arty1) setVariable["JOC_caching_disabled",true];

	_dir = round random 360;
	_locationS = [_location, random 60, random 60] call BIS_fnc_relPos;
	_arty2 = [_locationS, "O_MBT_02_arty_F"] call Zen_SpawnVehicle;
	createVehicleCrew _arty2;
	_arty2 addEventHandler["fired", {(_this select 0) setVehicleAmmo 1}];
	_arty2 setFuel 0;
	(driver _arty2) setVariable["JOC_caching_disabled",true];

	((crew _arty1) + (crew _arty2)) joinSilent artyGroup;
   	_s = _s + 1;
};
