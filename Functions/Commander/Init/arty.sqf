/////////////////////////
//Script made by Jochem//
/////////////////////////
artyGroup = createGroup east;
artyGroup setVariable["JOC_caching_disabled",true];
[artyGroup]call JOC_setGroupID;
_tankBlacklist = [];

_s = 0;
while{_s < 4}do{
	//Get position
	_location = ["mrk_area",0,[_tankBlacklist + blackMarkers + airfieldMarkers,[],[]],1,0,[0,360],[1,0,35],[0,0,0],[1,100],[1,10,15],[1,[0,0,-1],35]] call Zen_FindGroundPosition;

	[_location,30,"rhs_KORD_high_VDV"]call Zen_SpawnFortification;
	_static = _location nearestObject "rhs_KORD_high_VDV";
	createVehicleCrew _static;
	(gunner _static) setVariable["JOC_caching_disabled",true];
	(crew _static) joinSilent artyGroup;

	_nameS = format ["mrk_strategic_arty_%1",_s];
	_marker = createMarker [_nameS, _location];
   	_nameS setMarkerShape "ELLIPSE";
   	_nameS setMarkerSize [100,100];
    _nameS setMarkerBrush "SolidBorder";
    _nameS setMarkerColor "ColorOpfor";

	strategicArray pushBack [_location,60,"arty",_nameS,1];

	_nameM = [5] call Zen_StringGenerateRandom;
	_marker = createMarker [_nameM, _location];
   	_nameM setMarkerShape "RECTANGLE";
   	_nameM setMarkerSize [6000,6000];
    _nameM setMarkerBrush "Border";
    _nameM setMarkerAlpha 0;
	_tankBlacklist pushBack _nameM;

	//Spawn arty
	_dir = round random 360;
	_locationS = [_location, random 15, random 15] call BIS_fnc_relPos;
	_arty1 = [_locationS, artyClass] call Zen_SpawnVehicle;
	createVehicleCrew _arty1;
	_arty1 addEventHandler["fired", {(_this select 0) setVehicleAmmo 1}];
	_arty1 setFuel 0;

	_dir = round random 360;
	_locationS = [_location, random 15, random 15] call BIS_fnc_relPos;
	_arty2 = [_locationS, artyClass] call Zen_SpawnVehicle;
	createVehicleCrew _arty2;
	_arty2 addEventHandler["fired", {(_this select 0) setVehicleAmmo 1}];
	_arty2 setFuel 0;

	((crew _arty1) + (crew _arty2)) joinSilent artyGroup;
   	_s = _s + 1;
};

{
    deleteMarker _x;
} forEach _tankBlacklist;
