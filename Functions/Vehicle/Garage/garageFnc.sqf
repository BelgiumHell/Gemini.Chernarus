/////////////////////////
//Script made by Jochem//
/////////////////////////
private["_veh","_dis","_time","_codeE"];
params["_spawnObj"];
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

if(_dis > 10)then{
	hint "No vehicle spawned";
	sleep 2;
	_veh = nearestObjects [_spawnObj, ["AllVehicles"], 50];
	{
	    if(local _x && _x != player)then{
			deleteVehicle _x;
		};
	} forEach _veh;
}else{
	{
		deleteVehicle _x;
	}forEach (crew _veh);
	_codeE = [_veh]call BIS_fnc_exportVehicle;
	_class = typeOf _veh;
	deleteVehicle _veh;

	_codeS = [_codeE,"position player","(_this select 0)",true] call Zen_StringFindReplace;
	_codeS = _codeS + "_veh allowDamage false; _veh";
	_code = compile _codeS;
	_veh = [(getPos _spawnObj)]call _code;

	//Failsafe
	if(isNull _veh)then{
		_veh = _class createVehicle (getPos _spawnObj);
	};

	sleep 0.1;

	_spawnObj setVariable["count",((_spawnObj getVariable "count") + 1),true];
	_veh setVariable ["pad",_spawnObj,true];
	_veh setPos getPos _spawnObj;
	_veh setDir (getDir _spawnObj);
	_veh allowDamage true;
	if(_veh isKindOf "car")then{
		_time = 60;
	};
	if(_veh isKindOf "tank")then{
		_time = 120;
	};
	if(_veh isKindOf "Air")then{
		_time = 120;
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
