/////////////////////////
//Script made by Jochem//
/////////////////////////
_tankBlacklist = [];

//"Activate" radars
radars = nearestObjects [getMarkerPos "mrk_area",["Land_Radar_F","Land_Radar_Small_F"],worldSize*2.0^0.5];

{
	_location = getPos _x;

	_nameS = format ["mrk_strategic_radar_%1",_forEachIndex];
	_marker = createMarker [_nameS, _location];
   	_nameS setMarkerShape "ELLIPSE";
   	_nameS setMarkerSize [300,300];
    _nameS setMarkerBrush "SolidBorder";
    _nameS setMarkerColor "ColorOpfor";

	strategicArray pushBack [_location,500,"radar",_nameS,1];
} forEach radars;

//Place AA-tanks
_tank = 0;
_location = [];
_aaGroup1 = createGroup east;
_aaGroup1 setVariable["JOC_caching_disabled",true];
[_aaGroup1]call JOC_setGroupID;
_aaGroup2 = createGroup east;
_aaGroup2 setVariable["JOC_caching_disabled",true];
[_aaGroup2]call JOC_setGroupID;

while {_tank < 24} do{
	_location = ["mrk_area",0,[_tankBlacklist + blackMarkers + airfieldMarkers,[],[]],1,0,[0,360],[1,0,35],[0,0,0],[1,100],[1,10,15],[1,[0,0,-1],35]]call Zen_FindGroundPosition;

	[_location,10,"rhs_Igla_AA_pod_vdv"]call Zen_SpawnFortification;
	_aaLauncher = _location nearestObject "rhs_Igla_AA_pod_vdv";
	createVehicleCrew _aaLauncher;

	(crew _aaLauncher) joinSilent _aaGroup2;
	_aaTank = aaClass createVehicle _location;
	createVehicleCrew _aaTank;
	_aaTank setFuel 0;
	_aaTank setSkill 1;
	(crew _aaTank) joinSilent _aaGroup1;

	_nameS = format ["mrk_strategic_aa_%1",_tank];
	_marker = createMarker [_nameS, _location];
   	_nameS setMarkerShape "ELLIPSE";
   	_nameS setMarkerSize [100,100];
    _nameS setMarkerBrush "SolidBorder";
    _nameS setMarkerColor "ColorOpfor";

	strategicArray pushBack [_location,100,"aa",_nameS,1];

	_nameM = [5] call Zen_StringGenerateRandom;
	_marker = createMarker [_nameM, _location];
   	_nameM setMarkerShape "RECTANGLE";
   	_nameM setMarkerSize [2000,2000];
    _nameM setMarkerBrush "Border";
    _nameM setMarkerAlpha 0;
	_tankBlacklist pushBack _nameM;

	_tank = _tank + 1;
};

{
    deleteMarker _x;
} forEach _tankBlacklist;
