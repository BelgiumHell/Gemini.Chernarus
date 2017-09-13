/////////////////////////
//Script made by Jochem//
/////////////////////////
_artyGroup = createGroup east;
_artyGroup setVariable ["JOC_caching_disabled", true , true];
[_artyGroup] call JOC_coreSetID;
_tankBlacklist = [];

_s = 0;
while{_s < 4}do{
	//Get position
	_location = ["mrk_area", 0, [_tankBlacklist + blackMarkers + airfieldMarkers, [], []], 1, [3, 75], [0, 360], [1, 0, 35], [0, 0, 0], [1, 100], [1, 10, 15], [1, [0, 0, -1], 35]] call Zen_FindGroundPosition;

	_objects = [_location, 0, compArty] call BIS_fnc_ObjectsMapper;
	_group = createGroup east;

	{
        _obj = _x;

        createVehicleCrew _obj;
        if (typeOf _obj == classArty) then {
            (crew _obj) joinSilent _artyGroup;
        }else{
            (crew _obj) joinSilent _group;
        };
        _obj setFuel 0;
        _obj setSkill 1;
    } forEach _objects;

	_nameS = format ["mrk_strategic_arty_%1", _s];
	_marker = createMarker [_nameS, _location];
   	_nameS setMarkerShape "ELLIPSE";
   	_nameS setMarkerSize [100, 100];
    _nameS setMarkerBrush "SolidBorder";
    _nameS setMarkerColor "ColorOpfor";

	strategicArray pushBack [_location, 60, "arty", _nameS, 1, 2];

	_nameM = [5] call Zen_StringGenerateRandom;
	_marker = createMarker [_nameM, _location];
   	_nameM setMarkerShape "RECTANGLE";
   	_nameM setMarkerSize [6000, 6000];
    _nameM setMarkerBrush "Border";
    _nameM setMarkerAlpha 0;
	_tankBlacklist pushBack _nameM;

   	_s = _s + 1;
};

{
    deleteMarker _x;
} forEach _tankBlacklist;
