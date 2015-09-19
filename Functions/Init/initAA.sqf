/////////////////////////
//Script made by Jochem//
/////////////////////////
radarBlacklist = [];
tankBlacklist = [];

//Set radars
_radar = 0;
while {_radar < (aaCount / 2)} do
{
	_marker = format["mrk_aaZone_%1",_radar];
	_location = [_marker,0,[radarBlacklist + blackMarkers,["mrk_area"],[]],1,0,0,0,0,0,[1,10,50],[1,0,20]] call Zen_FindGroundPosition;
	_dish = "rhs_p37" createVehicle _location;
	zeusMod addCuratorEditableObjects [[_dish],false];

	[_dish] spawn JOC_radar;

	_nameM = [5] call Zen_StringGenerateRandom;
	_marker = createMarker [_nameM, _location];
   	_nameM setMarkerShape "ELLIPSE";
   	_nameM setMarkerSize [3000,3000];
    _nameM setMarkerBrush "Border";
    _nameM setMarkerColor "ColorOPFOR";
    _nameM setMarkerAlpha 0;

	_name = [5] call Zen_StringGenerateRandom;
	_marker = createMarker [_name, _location];
	_name setMarkerType "o_installation";

	[radarBlacklist,count radarBlacklist,_nameM] call Zen_ArrayInsert;

	_radar = _radar + 1;
};

//Place AA-tanks
_tank = 0;
_count = 0;
while {_tank < aaCount} do
{
	if(_count == (aaCount / 2))then{_count = 0};
	_marker = format["mrk_aaZone_%1",_count];

	_location = [_marker,0,[tankBlacklist + blackMarkers,["mrk_area"],[]],1,0,0,0,0,0,[1,10,50],[1,0,20]] call Zen_FindGroundPosition;
	_aaTank = "rhs_zsu234_aa" createVehicle _location;
	createVehicleCrew _aaTank;
	_aaTank setFuel 0;
	_aaTank addEventHandler["fired", {(_this select 0) setVehicleAmmo 1}];
	_aaTank setVariable["JOC_caching_disabled",true];
	zeusMod addCuratorEditableObjects [[_aaTank],false];
	zeusMod addCuratorEditableObjects [(crew _aaTank),false];

	_name = [5] call Zen_StringGenerateRandom;
	_marker = createMarker [_name, _location];
	_name setMarkerType "o_mortar";

	_nameM = [5] call Zen_StringGenerateRandom;
	_marker = createMarker [_nameM, _location];
   	_nameM setMarkerShape "RECTANGLE";
   	_nameM setMarkerSize [1500,1500];
    _nameM setMarkerBrush "Border";
    _nameM setMarkerColor "ColorOPFOR";
    _nameM setMarkerAlpha 0;
	[tankBlacklist,count tankBlacklist,_nameM] call Zen_ArrayInsert;

	_tank = _tank + 1;
	_count = _count + 1;
};
