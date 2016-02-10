/////////////////////////
//Script made by Jochem//
/////////////////////////
_tankBlacklist = [];

//"Activate" radars
_radars = nearestObjects [getMarkerPos "mrk_area",["Land_Radar_F","Land_Radar_Small_F"],worldSize*2.0^0.5];

{
	_location = getPos _x;

	_name = [5] call Zen_StringGenerateRandom;
	_marker = createMarker [_name, _location];
	_name setMarkerType "o_installation";
	_name setMarkerSize [0.65, 0.65];

	_nameS = format ["mrk_strategic_radar_%1",_forEachIndex];
	_marker = createMarker [_nameS, _location];
   	_nameS setMarkerShape "ELLIPSE";
   	_nameS setMarkerSize [300,300];
    _nameS setMarkerBrush "SolidBorder";
    _nameS setMarkerColor "ColorOpfor";

	strategicArray pushBack [_location,500,"radar",_nameS,east];

	[_x] spawn JOC_cmdMiscRadar;
} forEach _radars;


//Place AA-tanks
_tank = 0;
_location = [];
aaGroup = createGroup east;
while {_tank < 14} do{
	_location = [];
	while{count _location == 0}do{
		_pos = ["mrk_area",0,[_tankBlacklist + blackMarkers + airfieldMarkers,[],[]],1,0] call Zen_FindGroundPosition;
		_location  = _pos findEmptyPosition [0,300,emptyClass];
	};

	[_location,10,"rhs_KORD_high_VDV"]call Zen_SpawnFortification;

	_aaTank = aaClass createVehicle _location;
	createVehicleCrew _aaTank;
	_aaTank setFuel 0;
	_aaTank setSkill 1;
	(driver _aaTank) setVariable["JOC_caching_disabled",true];
	(crew _aaTank) joinSilent aaGroup;

	_name = [5] call Zen_StringGenerateRandom;
	_marker = createMarker [_name, _location];
	_name setMarkerType "n_art";
	_name setMarkerSize [0.65, 0.65];
	_name setMarkerColor "ColorOpfor";

	_nameS = format ["mrk_strategic_aa_%1",_tank];
	_marker = createMarker [_nameS, _location];
   	_nameS setMarkerShape "ELLIPSE";
   	_nameS setMarkerSize [100,100];
    _nameS setMarkerBrush "SolidBorder";
    _nameS setMarkerColor "ColorOpfor";

	strategicArray pushBack [_location,100,"aa",_nameS,east];

	_nameM = [5] call Zen_StringGenerateRandom;
	_marker = createMarker [_nameM, _location];
   	_nameM setMarkerShape "RECTANGLE";
   	_nameM setMarkerSize [2000,2000];
    _nameM setMarkerBrush "Border";
    _nameM setMarkerAlpha 0;
	_tankBlacklist pushBack _nameM;

	_tank = _tank + 1;
};
