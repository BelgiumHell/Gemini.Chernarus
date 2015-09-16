/////////////////////////
//Script made by Jochem//
/////////////////////////
private["_veh","_dis","_time"];

_spawnObj = _this select 0;

waitUntil {isNull(uiNamespace getVariable ["BIS_fnc_arsenal_cam",objNull])};
_veh = nearestObject [_spawnObj, "AllVehicles"];
_dis = _veh distance _spawnObj;

if(_dis > 5)then{}else{
	publicVariable "_veh";
	{
		deleteVehicle _x;
	}forEach (crew _veh);
	_spawnObj setVariable["count",((_spawnObj getVariable "count") + 1)];
	_veh setVariable ["pad",_spawnObj];
	_veh setDir (getDir _spawnObj);
	if(_veh isKindOf "car")then{
		_time = 60;
	};
	if(_veh isKindOf "tank")then{
		_time = 600;
	};
	if(_veh isKindOf "Air")then{
		_time = 600;
	};
	if(_veh isKindOf "Ship")then{
		_time = 60;
	};

	[_veh]spawn JOC_vehInit;

	[[[_veh],{(_this select 0) setVehicleLock "LOCKED";}],"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
	hint format["Vehicle will be ready in %1 minute(s)", (_time/60)];
	sleep _time;
	[[[_veh],{(_this select 0) setVehicleLock "UNLOCKED";}],"BIS_fnc_spawn",true,true] call BIS_fnc_MP;
	hint "Vehicle is ready";
};
