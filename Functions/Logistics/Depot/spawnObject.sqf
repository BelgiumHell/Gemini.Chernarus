/////////////////////////
//Script made by Jochem//
/////////////////////////
params["_type"];
_unable = true;

//Get spawn obj
{
	_veh = (nearestObjects [(getPosASL _x), ["All"], 3] - [_x]);
	if ((count _veh) == 0) then {
		_obj = _type createVehicle [99995, 99995, 10];
		_obj setDir (getDir _x);
		_obj setPosASL (getPosASL _x);
		[_obj] spawn JOC_crateInit;
		_unable = false;
	};
	if ((count _veh) == 0) exitWith {};
} forEach [logiSpawn_0, logiSpawn_1, logiSpawn_2, logiSpawn_3, logiSpawn_4, logiSpawn_5];

if (_unable) then {
	hint "No empty pads available";
};
