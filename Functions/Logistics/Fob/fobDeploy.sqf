/////////////////////////
//Script made by Jochem//
/////////////////////////
private ["_truck","_unable"];

_truck = _this select 0;
_unable = false;

//Composition
_objArray = [];
_radius = 12;
_isFlat = (getPosASL _truck)isFlatEmpty [
	_radius,	//--- Minimal distance from another object
	0,				//--- If 0, just check position. If >0, select new one
	0.4,			//--- Max gradient
	_radius max 5,	//--- Gradient area
	0,				//--- 0 for restricted water, 2 for required water,
	false,			//--- Has to have shore nearby!
	objNull			//--- Ignored object
];

if(!(count _isFlat isEqualTo 0))then{
	{
		_type = _x select 0;
		_offset = _x select 1;
		_newdir = _x select 2;

		_obj = createVehicle [_type, [0,0,0], [], 0, "CAN_COLLIDE"];
		_obj allowDamage false;
		[_truck,_obj,_offset,_newdir, true, true] call BIS_fnc_relPosObject;
		_objArray pushBack _obj;
	}forEach fobComposition;
}else{
	hint "Terrain not suitable";
	_unable = true;
};

if(_unable)exitWith{};

[[[_truck],{removeAllActions (_this select 0);(_this select 0) setVehicleLock "LOCKED";}],"BIS_fnc_spawn",true,true] call BIS_fnc_MP;

{
	_x action ["eject", _truck]
} forEach (crew _truck);

_name = [6] call Zen_StringGenerateRandom;
_marker = createMarker [_name, (getPos _truck)];
_marker setMarkerType "b_support";
_marker setMarkerText "FOB";

[["RespawnAdded",["DEPLOYMENT POINT",format ["HQ deployed at grid %1", mapGridPosition (getPos _truck)],"\A3\ui_f\data\map\markers\nato\b_hq.paa"]],"BIS_fnc_showNotification",west] call BIS_fnc_MP;	//Notification
[[[_truck,_objArray,_name],{_action = (_this select 0) addAction["Dismantle FOB",{[(_this select 0),(_this select 1)] spawn JOC_fobUndeploy; deleteMarker (_this select 2);},"",1,true,true,"","(side _this == west) && (speed _target < 1)"];}],"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
[[[_truck],{_action = (_this select 0) addAction["Relocate",{
	_fobArray = []call JOC_fobGetLocations;
	[(findDisplay 46), getpos (_this select 1), _fobArray, [], [], [], 1, false] call BIS_fnc_strategicMapOpen;
},"",1,true,true,"","(side _this == west) && (speed _target < 1)"];}],"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
