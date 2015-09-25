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
	_spawnObj setVariable["unable",true];
	hint format["Pad will be available in %1 minutes", (_time/60)];
	sleep _time;
	_spawnObj setVariable["unable",false];
};
