/////////////////////////
//Script made by Jochem//
/////////////////////////
tankBlacklist = [];

//"Activate" radars
_radars = nearestObjects [getMarkerPos "mrk_area",["Land_Radar_F","Land_Radar_Small_F"],worldSize*2.0^0.5];

{
	_location = getPos _x;

	_name = [5] call Zen_StringGenerateRandom;
	_marker = createMarker [_name, _location];
	_name setMarkerType "o_installation";
	_name setMarkerSize [0.65, 0.65];

	[_x,_name] spawn JOC_radar;
} forEach _radars;


//Place AA-tanks
_tank = 0;
_location = [];
aaGroup = createGroup east;
while {_tank < aaCount} do
{
	_location = [];
	while{count _location == 0}do{
		_pos = ["mrk_area",0,[tankBlacklist + (opMarkers select 2) + blackMarkers,[],[]],1,0] call Zen_FindGroundPosition;
		_location  = _pos findEmptyPosition [0,300,"rhs_zsu234_aa"];
	};

	_aaTank = "rhs_zsu234_aa" createVehicle _location;
	createVehicleCrew _aaTank;
	_aaTank setFuel 0;
	_aaTank addEventHandler["fired", {(_this select 0) setVehicleAmmo 1}];
	_aaTank setVariable["JOC_caching_disabled",true];
	(crew _aaTank) joinSilent aaGroup;

	_name = [5] call Zen_StringGenerateRandom;
	_marker = createMarker [_name, _location];
	_name setMarkerType "o_mortar";
	_name setMarkerSize [0.65, 0.65];

	_aaTank setVariable ["marker",_name];
	_aaTank addEventHandler ["killed", {deleteMarker ((_this select 0) getVariable "marker");}];

	_nameM = [5] call Zen_StringGenerateRandom;
	_marker = createMarker [_nameM, _location];
   	_nameM setMarkerShape "RECTANGLE";
   	_nameM setMarkerSize [1500,1500];
    _nameM setMarkerBrush "Border";
    _nameM setMarkerColor "ColorOPFOR";
    _nameM setMarkerAlpha 0;
	[tankBlacklist,count tankBlacklist,_nameM] call Zen_ArrayInsert;

	_tank = _tank + 1;
};
