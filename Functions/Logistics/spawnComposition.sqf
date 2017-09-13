/////////////////////////
//Script made by Jochem//
/////////////////////////
_compArray = _this select 0;
_pos = _this select 1;

_baseObj = "Land_HelipadEmpty_F" createVehicle _pos;
_objArray = [];

{
	_type = _x select 0;
	_offset = _x select 1;
	_newdir = _x select 2;

	_obj = createVehicle [_type, [0, 0, 0], [], 0, "CAN_COLLIDE"];
	_obj allowDamage false;
	[_baseObj, _obj, _offset, _newdir, true, true] call BIS_fnc_relPosObject;
	_obj allowDamage true;
	_objArray pushBack _obj;
} forEach _compArray;

deleteVehicle _obj;

_objArray
