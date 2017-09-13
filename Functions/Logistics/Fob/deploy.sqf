/////////////////////////
//Script made by Jochem//
/////////////////////////
private ["_truck", "_unable"];

_truck = _this select 0;
_unable = false;

//Composition
_objArray = [];
_radius = 12;
_isFlat = (getPosASL _truck) isFlatEmpty [
	_radius, 		//--- Minimal distance from another object
	0, 				//--- If 0, just check position. If >0, select new one
	0.4, 			//--- Max gradient
	_radius max 5, 	//--- Gradient area
	0, 				//--- 0 for restricted water, 2 for required water, 
	false, 			//--- Has to have shore nearby!
	objNull			//--- Ignored object
];

if (!(count _isFlat isEqualTo 0)) then {
	{
		_type = _x select 0;
		_offset = _x select 1;
		_newdir = _x select 2;

		_obj = createVehicle [_type, [0, 0, 0], [], 0, "CAN_COLLIDE"];
		_obj allowDamage false;
		[_truck, _obj, _offset, _newdir, true, true] call BIS_fnc_relPosObject;

		//Arsenal
		if (_type == "B_CargoNet_01_ammo_F") then {
			[_obj] call JOC_arsenal;
		};

		_objArray pushBack _obj;
	} forEach fobComposition;
}else{
	hint "Terrain not suitable";
	_unable = true;
};

if (_unable)exitWith{};

{
	_x action ["eject", _truck]
} forEach (crew _truck);

_name = [6] call Zen_StringGenerateRandom;
_marker = createMarker [_name, (getPos _truck)];
_marker setMarkerType "b_support";
_marker setMarkerText "FOB";

_posH = player modelToWorld [2, 0, 0];
_pos = _object setPosATL [_posH select 0, _posH select 1, 0];

_respawn = [west, [(_truck modelToWorld [2, 0, 0]) select 0, (_truck modelToWorld [2, 0, 0]) select 1], format ["FOB grid %1", mapGridPosition (getPos _truck)]] call BIS_fnc_addRespawnPosition;

_truck setVariable ["assignedFob", [_objArray, _name, _respawn], true];

//Notification
["RespawnAdded", ["DEPLOYMENT POINT", format ["HQ deployed at grid %1", mapGridPosition (getPos _truck)], "\A3\ui_f\data\map\markers\nato\b_hq.paa"]] remoteExec ["BIS_fnc_showNotification", 0, true];

//Lock truck
[[_truck], {
	params["_truck"];
	_truck lock 2;
}] remoteExec ["BIS_fnc_spawn", 0, true];
