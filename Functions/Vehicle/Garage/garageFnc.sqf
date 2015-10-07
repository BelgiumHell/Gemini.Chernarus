/////////////////////////
//Script made by Jochem//
/////////////////////////
private["_veh","_dis","_time","_codeE"];

_spawnObj = _this select 0;
_oldVeh = objNull;

while{!(isNull(uiNamespace getVariable ["BIS_fnc_arsenal_cam",objNull]))}do{
	_veh = nearestObject [_spawnObj, "AllVehicles"];
	_dis = _veh distance _spawnObj;
	if((_dis < 4) && (_oldVeh != _veh))then{
		_veh setPos getPos _spawnObj;
		_veh setDir (getDir _spawnObj);
		_oldVeh = _veh;
	};
};

waitUntil {isNull(uiNamespace getVariable ["BIS_fnc_arsenal_cam",objNull])};

sleep 1;
_veh = nearestObject [_spawnObj, "AllVehicles"];
_dis = _veh distance _spawnObj;

if(_dis > 5)then{hint "No vehicle spawned";}else{
	_codeE = [_veh]call BIS_fnc_exportVehicle;
	deleteVehicle _veh;
	_codeS = [_codeE,"position player","(_this select 0)",true] call Zen_StringFindReplace;
	_codeS = _codeS + " _veh";
	_code = compile _codeS;
	_veh = [(getPos _spawnObj)]call _code;

	{
		deleteVehicle _x;
	}forEach (crew _veh);

	sleep 0.1;

	_spawnObj setVariable["count",((_spawnObj getVariable "count") + 1),true];
	_veh setVariable ["pad",_spawnObj,true];
	_veh setPos getPos _spawnObj;
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
	_spawnObj setVariable["unable",true,true];
	hint format["Pad will be back available in %1 minutes", (_time/60)];
	sleep _time;
	_spawnObj setVariable["unable",false,true];
};
