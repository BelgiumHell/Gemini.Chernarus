/////////////////////////
//Script made by Jochem//
/////////////////////////
_tankBlacklist = [];

//"Activate" radars
/*
{
	_location = getPos _x;

	_nameS = format ["mrk_strategic_radar_%1", _forEachIndex];
	_marker = createMarker [_nameS, _location];
   	_nameS setMarkerShape "ELLIPSE";
   	_nameS setMarkerSize [300, 300];
    _nameS setMarkerBrush "SolidBorder";
    _nameS setMarkerColor "ColorOpfor";

	strategicArray pushBack [_location, 500, "radar", _nameS, 1];
} forEach radars;*/

//Place AA-tanks
_location = [];
_group = createGroup east;
_group setVariable ["JOC_caching_disabled", true, true];

for "_tank" from 0 to 24 step 1 do {
	_location = ["mrk_area", 0, [_tankBlacklist + blackMarkers + airfieldMarkers, [], []], 1, [3, 75], [0, 360], [1, 0, 35], [0, 0, 0], [1, 100], [1, 10, 15], [1, [0, 0, -1], 35]] call Zen_FindGroundPosition;

	_objects = [_location, random 360, compAA] call BIS_fnc_ObjectsMapper;

	{
        createVehicleCrew _x;
        (crew _x) joinSilent _group;
		
        _x setFuel 0;
        _x setSkill 1;
		_x setVehicleRadar 1;
        _x setVehicleReportOwnPosition true;
        _x setVehicleReceiveRemoteTargets true;
    } forEach _objects;

	_nameS = format ["mrk_strategic_aa_%1", _tank];
	_marker = createMarker [_nameS, _location];
   	_nameS setMarkerShape "ELLIPSE";
   	_nameS setMarkerSize [100, 100];
    _nameS setMarkerBrush "SolidBorder";
    _nameS setMarkerColor "ColorOpfor";

	strategicArray pushBack [_location, 100, "aa", _nameS, 1, 2];

	_nameM = [5] call Zen_StringGenerateRandom;
	_marker = createMarker [_nameM, _location];
   	_nameM setMarkerShape "RECTANGLE";
   	_nameM setMarkerSize [2000, 2000];
    _nameM setMarkerBrush "Border";
    _nameM setMarkerAlpha 0;
	_tankBlacklist pushBack _nameM;
};

{
    deleteMarker _x;
} forEach _tankBlacklist;
